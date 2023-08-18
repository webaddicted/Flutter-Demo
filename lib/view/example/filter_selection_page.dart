import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rect_getter/rect_getter.dart';

class FilterSelectionPage extends StatefulWidget {
  @override
  _FilterSelectionPageState createState() => _FilterSelectionPageState();
}

class _FilterSelectionPageState extends State<FilterSelectionPage>
    with SingleTickerProviderStateMixin {
  IngredientService service = IngredientService();
  late List<Ingredient> allIngredient, selectedIngredients;
  late AnimationController _controller;
  late Animation<Rect?> _moveAnimation;
  late Animation<Offset> _siMoveAnimation;
  late Animation<double> _scaleAnimation,
      _clippedIngredientScaleAnim,
      _clippedNotificationScaleAnim;
  late Animation<Color?> _clippedIngredientColorAnim, _selectedIngredientColorAnim;
  late int? selectedId, recipesFound = 0;
  late Offset ingredientStartOffset;

  late Timer cleanupTimer;

  bool showCounter = false;
  int noClippedSelectedIngredients = 0;

  var firstIngredientKey = RectGetter.createGlobalKey();

  @override
  void initState() {
    super.initState();
    allIngredient = service.allIngredients;
    selectedIngredients = service.selectedIngredient;
    _controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 500));

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.5).animate(
        CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.5, 0.7, curve: Curves.elasticInOut)));

    _clippedIngredientScaleAnim = Tween<double>(begin: 1.0, end: 0.3).animate(
        CurvedAnimation(parent: _controller, curve: const Interval(0.5, 0.8)));

    _clippedNotificationScaleAnim = Tween<double>(begin: 35.0, end: 45.0)
        .animate(
            CurvedAnimation(parent: _controller, curve: const Interval(0.7, 0.8)));

    _clippedIngredientColorAnim =
        ColorTween(begin: Colors.pink[300], end: Colors.black).animate(
            CurvedAnimation(parent: _controller, curve: const Interval(0.5, 1.0)));

    _selectedIngredientColorAnim =
        ColorTween(begin: Colors.blue[800], end: Colors.pink[300]).animate(
            CurvedAnimation(
                parent: _controller,
                curve: const Interval(0.0, 0.3, curve: Curves.elasticInOut)));
  }

  @override
  Widget build(BuildContext context) {
    TextStyle whiteTextTheme =
        Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white);

    return Scaffold(
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Column(
              children: <Widget>[
                SizedBox(
                  height: 50.0,
                  child: _getSelectedIngredients(),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    color: Colors.black12,
                    child: Center(
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 5.0,
                        children: _getUnselectedIngredients(),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      bottomSheet: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20.0, bottom: 30.0, top: 20.0),
              child: MaterialButton(
                color: Colors.pink[300],
                child: Text(
                  "$recipesFound recipes found",
                  style: whiteTextTheme,
                ),
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
    );
  }

  _getSelectedIngredients() {
    if (selectedIngredients.length == 0) {
      return RectGetter(
        key: firstIngredientKey,
        child: Center(
            child: Text(
          "Select Ingredients",
          style: Theme.of(context).textTheme.titleMedium,
        )),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Transform.translate(
          offset: getSelIngredientMoveOffset(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: selectedIngredients.map((ingredient) {
              return Transform(
                transform: Matrix4.diagonal3Values(
                    getSelectedIngredientScaleOffset(ingredient.id), 1.0, 1.0),
                child: RectGetter(
                  key: ingredient.key,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: SelectedChip(
                        ingredient: ingredient,
                        color: _getSelectedIngredientColor(ingredient.id),
                      )),
                ),
              );
            }).toList(),
          ),
        ),
        getNotificationBubble()
      ],
    );
  }

  Widget getNotificationBubble() {
    TextStyle whiteTextTheme =
        Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.white);

    if (showCounter) {
      return ClipOval(
        child: Container(
          width: _clippedNotificationScaleAnim.value,
          height: _clippedNotificationScaleAnim.value,
          color: Colors.black,
          child: Center(
            child: Text(
              "+$noClippedSelectedIngredients",
              style: whiteTextTheme,
            ),
          ),
        ),
      );
    }
    return Container();
  }

  _getUnselectedIngredients() {
    return allIngredient.map((ingredient) {
      return RectGetter(
        key: ingredient.key,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Transform.translate(
            offset: getOffsetValue(ingredient.id),
            child: Transform.scale(
              scale: getScaleValue(ingredient.id),
              child: SelectableChip(
                ingredient: ingredient,
                color: getSelectableIngredientColor(ingredient.id),
                onPressed: (id) => _chipPressed(id),
              ),
            ),
          ),
        ),
      );
    }).toList();
  }

  _chipPressed(int id) async {
    var ingredient = service.allIngredients.firstWhere((ing) => ing.id == id);

    var ingredientBeginRect = RectGetter.getRectFromKey(ingredient.key);
    var ingredientEndRect;
    if (selectedIngredients.length > 0) {
      var firstSelectedIngredient = selectedIngredients[0];
      ingredientEndRect =
          RectGetter.getRectFromKey(firstSelectedIngredient.key);
    } else {
      ingredientEndRect = RectGetter.getRectFromKey(firstIngredientKey);
    }

    setState(() {
      selectedId = id;
      ingredientStartOffset = ingredientBeginRect!.center;
    });

    setupMovementAnimation(ingredientBeginRect!, ingredientEndRect);

    await _controller.forward();

    Ingredient selIng = Ingredient(ingredient.id, ingredient.name);
    ingredient.width = RectGetter.getRectFromKey(ingredient.key)!.width;

    if (cleanupTimer != null) {
      cleanupTimer.cancel();
    }

    setState(() {
      selectedId = null;
      ingredient.name = "";
      cleanupTimer = Timer(const Duration(seconds: 2), () => _timerCleanup());
      selectedIngredients.insert(0, selIng);
    });

    cleanupSelectedIngredients();
    _controller.reset();
  }

  getOffsetValue(int id) {
    if (selectedId != null && selectedId == id) {
      var offset = _moveAnimation.value!.center - ingredientStartOffset;
      return offset;
    }
    return Offset.zero;
  }

  getScaleValue(int id) {
    if (selectedId != null && selectedId == id) {
      return _scaleAnimation.value;
    }
    return 1.0;
  }

  getSelIngredientMoveOffset() {
    if (selectedId != null) {
      return _siMoveAnimation.value;
    }
    return Offset.zero;
  }

  setupMovementAnimation(Rect begin, Rect end) {
    _moveAnimation = RectTween(begin: begin, end: end).animate(
        CurvedAnimation(parent: _controller, curve: const Interval(0.5, 1.0)));
    _siMoveAnimation =
        Tween<Offset>(begin: Offset.zero, end: const Offset(100.0, 0.0)).animate(
            CurvedAnimation(parent: _controller, curve: const Interval(0.5, 1.0)));
  }

  void cleanupSelectedIngredients() {
    var screenWidth = MediaQuery.of(context).size.width;

    var totalWidth = 0.0;
    for (var ingredient in selectedIngredients) {
      var rect = RectGetter.getRectFromKey(ingredient.key);
      if (rect != null) totalWidth += rect.width;
    }

    if (totalWidth >= screenWidth - 200.0) {
      setState(() {
        noClippedSelectedIngredients += 1;
        showCounter = true;
      });
      selectedIngredients.removeLast();
    }
  }

  getSelectedIngredientScaleOffset(int id) {
    if (id == selectedIngredients.last.id && noClippedSelectedIngredients > 0) {
      return _clippedIngredientScaleAnim.value;
    }
    return 1.0;
  }

  _getSelectedIngredientColor(int id) {
    if (id == selectedIngredients.last.id && noClippedSelectedIngredients > 0) {
      return _clippedIngredientColorAnim.value;
    }
    return Colors.pink[300];
  }

  void _timerCleanup() {
    var toCleanupCount =
        allIngredient.where((ing) => ing.name.isEmpty).toList().length;
    if (toCleanupCount > 0) {
      setState(() {
        allIngredient.removeWhere((ing) => ing.name.isEmpty);
        recipesFound = Random().nextInt(2000);
      });
    }
  }

  getSelectableIngredientColor(int id) {
    if (selectedId != null && selectedId == id) {
      return _selectedIngredientColorAnim.value;
    }
    return Colors.blue[800];
  }
}

class SelectableChip extends StatelessWidget {
  final Ingredient? ingredient;
  final Function? onPressed;
  final Color? color;

  SelectableChip({this.ingredient, this.onPressed, this.color});

  @override
  Widget build(BuildContext context) {
    TextStyle chipStyle = Theme.of(context)
        .textTheme
        .labelMedium
        !.copyWith(color: Colors.white, fontSize: 14.0);

    if (ingredient!.name.isEmpty) {
      return SizedBox(
        width: ingredient!.width! - 4.0,
        height: 45.0,
      );
    }

    return GestureDetector(
      onTap: () => onPressed!(ingredient!.id),
      child: Chip(
        padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 0.0),
        backgroundColor: color,
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              ingredient!.name,
              style: chipStyle,
            ),
            IconButton(
              icon: const Icon(
                Icons.add,
                size: 20.0,
              ),
              color: Colors.white,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}

class SelectedChip extends StatelessWidget {
  final Ingredient? ingredient;
  final Color? color;

  SelectedChip({this.ingredient, this.color});

  @override
  Widget build(BuildContext context) {
    TextStyle whiteTextTheme =
        Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.white);
    return Chip(
      backgroundColor: color,
      label: Row(
        children: <Widget>[
          Text(
            ingredient!.name,
            style: whiteTextTheme,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 4.0),
            child: Icon(
              Icons.check,
              size: 16.0,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

class IngredientService {
  static final IngredientService _singleton = IngredientService._internal();

  factory IngredientService() {
    return _singleton;
  }

  IngredientService._internal();

  List<Ingredient> allIngredients = [
    Ingredient(1, "apple"),
    Ingredient(2, "butter"),
    Ingredient(3, "eggs"),
    Ingredient(4, "mozarella"),
    Ingredient(5, "salad"),
    Ingredient(6, "pasta"),
    Ingredient(7, "red pepper"),
    Ingredient(8, "onion"),
    Ingredient(9, "garlic"),
    Ingredient(10, "tomato"),
    Ingredient(11, "bread"),
    Ingredient(12, "milk"),
    Ingredient(13, "cottage Cheese"),
    Ingredient(14, "turkey"),
    Ingredient(15, "lamb"),
    Ingredient(16, "salmon"),
    Ingredient(17, "bacon"),
    Ingredient(18, "peas"),
    Ingredient(19, "shrimp"),
    Ingredient(20, "cod"),
    Ingredient(21, "crab"),
    Ingredient(22, "peach"),
    Ingredient(23, "pork"),
    Ingredient(24, "banana"),
    Ingredient(25, "sugar"),
    Ingredient(26, "honey")
  ];

  List<Ingredient> selectedIngredient = [];
}

class Ingredient {
  int id;
  String name;
  var key;
  double? width;

  Ingredient(this.id, this.name) {
    key = RectGetter.createGlobalKey();
    width = 0.0;
  }
}

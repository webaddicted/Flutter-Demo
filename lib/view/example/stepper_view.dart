import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:timeline_tile/timeline_tile.dart';

class StepperView extends StatefulWidget {
  @override
  _StepperViewState createState() => _StepperViewState();
}

class _StepperViewState extends State<StepperView> {
  BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBarWithBackBtn(
            ctx: context, title: StringConst.STEPPER_TITLE),
        body: Builder(
          builder: (context) => _createUi(context),
        ));
  }

  Widget _createUi(BuildContext context) {
    ctx = context;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _Header(),
          _DeliveryTimeline(),
          WeatherTimeline(),
          _TimelineVerticalDelivery(),
        ],
      ),
    );
  }
}

class _TimelineVerticalDelivery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        children: <Widget>[
          TimelineTile(
            alignment: TimelineAlign.manual,
            lineXY: 0.1,
            isFirst: true,
            indicatorStyle: const IndicatorStyle(
              width: 20,
              color: Color(0xFF27AA69),
              padding: EdgeInsets.all(6),
            ),
            endChild:  _RightChild(
              asset: AssetsConst.TAKE_PHONE,
              title: 'Order Placed',
              message: 'We have received your order.',
            ),
            beforeLineStyle: const LineStyle(
              color: Color(0xFF27AA69),
            ),
          ),
          TimelineTile(
            alignment: TimelineAlign.manual,
            lineXY: 0.1,
            indicatorStyle: const IndicatorStyle(
              width: 20,
              color: Color(0xFF27AA69),
              padding: EdgeInsets.all(6),
            ),
            endChild:_RightChild(
              asset: AssetsConst.ORDER_FOOD,
              title: 'Order Confirmed',
              message: 'Your order has been confirmed.',
            ),
            beforeLineStyle: const LineStyle(
              color: Color(0xFF27AA69),
            ),
          ),
          TimelineTile(
            alignment: TimelineAlign.manual,
            lineXY: 0.1,
            indicatorStyle: const IndicatorStyle(
              width: 20,
              color: Color(0xFF2B619C),
              padding: EdgeInsets.all(6),
            ),
            endChild: _RightChild(
              asset: AssetsConst.PAY,
              title: 'Order Processed',
              message: 'We are preparing your order.',
            ),
            beforeLineStyle: const LineStyle(
              color: Color(0xFF27AA69),
            ),
            afterLineStyle: const LineStyle(
              color: Color(0xFFDADADA),
            ),
          ),
          TimelineTile(
            alignment: TimelineAlign.manual,
            lineXY: 0.1,
            isLast: true,
            indicatorStyle: const IndicatorStyle(
              width: 20,
              color: Color(0xFFDADADA),
              padding: EdgeInsets.all(6),
            ),
            endChild: _RightChild(
              disabled: true,
              asset: AssetsConst.WAIT_FOR_DELIVERY,
              title: 'Ready to Pickup',
              message: 'Your order is ready for pickup.',
            ),
            beforeLineStyle: const LineStyle(
              color: Color(0xFFDADADA),
            ),
          ),
        ],
      ),
    );
  }
}

class _RightChild extends StatelessWidget {
  const _RightChild({
    Key key,
    this.asset,
    this.title,
    this.message,
    this.disabled = false,
  }) : super(key: key);

  final String asset;
  final String title;
  final String message;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          Opacity(
            child: Image.asset(asset,color:Colors.grey , height: 50),
            opacity: disabled ? 0.5 : 1,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                getTxtColor(
                  msg: title,
                  txtColor: disabled
                      ? const Color(0xFFBABABA)
                      : const Color(0xFF636564),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(height: 6),
                getTxtColor(
                  msg: message,
                  txtColor: disabled
                      ? const Color(0xFFD5D5D5)
                      : const Color(0xFF636564),
                  fontSize: 16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFF9F9F9),
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFE9E9E9),
            width: 3,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  getTxtColor(
                    msg: 'ESTIMATED TIME',
                    txtColor: const Color(0xFFA2A2A2),
                    fontSize: 16,
                  ),
                  getTxtColor(
                    msg: '30 minutes',
                    txtColor: const Color(0xFF636564),
                    fontSize: 16,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  getTxtColor(
                    msg: 'ORDER NUMBER',
                    txtColor: const Color(0xFFA2A2A2),
                    fontSize: 16,
                  ),
                  getTxtColor(
                    msg: '#2482011',
                    txtColor: const Color(0xFF636564),
                    fontSize: 16,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WeatherTimeline extends StatefulWidget {
  @override
  _WeatherTimelineState createState() => _WeatherTimelineState();
}

class _WeatherTimelineState extends State<WeatherTimeline> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFDB84B1),
      child: ListView(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        children: <Widget>[
          TimelineTile(
            alignment: TimelineAlign.manual,
            lineXY: 0.3,
            isFirst: true,
            indicatorStyle: IndicatorStyle(
              width: 70,
              height: 70,
              indicator: _Sun(),
            ),
            beforeLineStyle: LineStyle(color: Colors.white.withOpacity(0.7)),
            endChild: _ContainerHeader(),
          ),
          _buildTimelineTile(
            indicator: const _IconIndicator(
              iconData: Icons.cloud_circle,
              size: 20,
            ),
            hour: '18:00',
            weather: 'Cloudy',
            temperature: '26°C',
            phrase: 'A beautiful afternoon to take a walk into the park.'
                " Don't forget to take your water.",
          ),
          _buildTimelineTile(
            indicator: const _IconIndicator(
              iconData: Icons.wb_sunny_sharp,
              size: 20,
            ),
            hour: '20:00',
            weather: 'Sunset',
            temperature: '24°C',
            phrase: 'Enjoy the view, the sun will be back tomorrow.',
          ),
          _buildTimelineTile(
            indicator: const _IconIndicator(
              iconData: Icons.nights_stay_rounded,
              size: 20,
            ),
            hour: '22:00',
            weather: 'Fall of rain',
            temperature: '18°C',
            phrase: 'Temperature is decreasing...',
          ),
          _buildTimelineTile(
            indicator: const _IconIndicator(
              iconData: Icons.flight_takeoff_rounded,
              size: 20,
            ),
            hour: '00:00',
            weather: 'Chilly',
            temperature: '16°C',
            phrase: "Have a good night, don't forget your blanket.",
            isLast: true,
          ),
        ],
      ),
    );
  }

  TimelineTile _buildTimelineTile({
    _IconIndicator indicator,
    String hour,
    String weather,
    String temperature,
    String phrase,
    bool isLast = false,
  }) {
    return TimelineTile(
      alignment: TimelineAlign.manual,
      lineXY: 0.3,
      beforeLineStyle: LineStyle(color: Colors.white.withOpacity(0.7)),
      indicatorStyle: IndicatorStyle(
        indicatorXY: 0.3,
        drawGap: true,
        width: 30,
        height: 30,
        indicator: indicator,
      ),
      isLast: isLast,
      startChild: Center(
        child: Container(
          alignment: const Alignment(0.0, -0.50),
          child: getTxtColor(
            msg: hour,
            fontSize: 18,
            txtColor: Colors.white.withOpacity(0.6),
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      endChild: Padding(
        padding:
            const EdgeInsets.only(left: 16, right: 10, top: 10, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            getTxtColor(
              msg: weather,
              fontSize: 18,
              txtColor: Colors.white.withOpacity(0.8),
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 4),
            getTxtColor(
              msg: temperature,
              fontSize: 16,
              txtColor: Colors.white.withOpacity(0.8),
              fontWeight: FontWeight.normal,
            ),
            const SizedBox(height: 4),
            getTxtColor(
              msg: phrase,
              fontSize: 14,
              txtColor: Colors.white.withOpacity(0.6),
              fontWeight: FontWeight.normal,
            )
          ],
        ),
      ),
    );
  }
}

class _IconIndicator extends StatelessWidget {
  const _IconIndicator({
    Key key,
    this.iconData,
    this.size,
  }) : super(key: key);

  final IconData iconData;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(0.7),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 30,
              width: 30,
              child: Icon(
                iconData,
                size: size,
                color: const Color(0xFF9E3773).withOpacity(0.7),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ContainerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 120),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            getTxtColor(
              msg: 'now - 17:30',
              fontSize: 18,
              txtColor: const Color(0xFFF4A5CD),
            ),
            getTxtColor(
              msg: 'Sunny',
              fontSize: 30,
              txtColor: Colors.white.withOpacity(0.8),
              fontWeight: FontWeight.w800,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: getTxtColor(
                    msg: 'Humidity 40%',
                    // overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.right,
                    fontSize: 14,
                    txtColor: const Color(0xFF4A448F).withOpacity(0.8),
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(width: 20),
                getTxtColor(
                  msg: '30°C',
                  fontSize: 14,
                  txtColor: const Color(0xFF4A448F).withOpacity(0.8),
                  fontWeight: FontWeight.w800,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _Sun extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            blurRadius: 25,
            spreadRadius: 20,
          ),
        ],
        shape: BoxShape.circle,
        color: Colors.white,
      ),
    );
  }
}

const deliverySteps = [
  'Take your phone',
  'Choose a restaurant',
  'Order the food',
  'Wait for delivery',
  'Pay',
  'Eat and enjoy',
];

class _DeliveryTimeline extends StatefulWidget {
  const _DeliveryTimeline();

  @override
  _DeliveryTimelineState createState() => _DeliveryTimelineState();
}

class _DeliveryTimelineState extends State<_DeliveryTimeline> {
  ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const currentStep = 3;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(currentStep * 120.0);
    });
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      constraints: const BoxConstraints(maxHeight: 210),
      color: const Color(0xFF5D6173),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        controller: _scrollController,
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: deliverySteps.length,
        itemBuilder: (BuildContext context, int index) {
          final step = deliverySteps[index];
          var indicatorSize = 30.0;
          var beforeLineStyle = LineStyle(
            color: Colors.white.withOpacity(0.8),
          );

          _DeliveryStatus status;
          LineStyle afterLineStyle;
          if (index < currentStep) {
            status = _DeliveryStatus.done;
          } else if (index > currentStep) {
            status = _DeliveryStatus.todo;
            indicatorSize = 20;
            beforeLineStyle = const LineStyle(color: Color(0xFF747888));
          } else {
            afterLineStyle = const LineStyle(color: Color(0xFF747888));
            status = _DeliveryStatus.doing;
          }

          return TimelineTile(
            axis: TimelineAxis.horizontal,
            alignment: TimelineAlign.manual,
            lineXY: 0.6,
            isFirst: index == 0,
            isLast: index == deliverySteps.length - 1,
            beforeLineStyle: beforeLineStyle,
            afterLineStyle: afterLineStyle,
            indicatorStyle: IndicatorStyle(
              width: indicatorSize,
              height: indicatorSize,
              indicator: _IndicatorDelivery(status: status),
            ),
            startChild: _StartChildDelivery(index: index),
            endChild: _EndChildDelivery(
              text: step,
              current: index == currentStep,
            ),
          );
        },
      ),
    );
    // ),
    // );
  }
}

enum _DeliveryStatus { done, doing, todo }

class _StartChildDelivery extends StatelessWidget {
  const _StartChildDelivery({Key key, this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    var assImg = '';
    if(index==0)assImg =  AssetsConst.TAKE_PHONE;
    else if(index==1)assImg =  AssetsConst.CHOOSE_RESTRO;
    else if(index==2)assImg =  AssetsConst.ORDER_FOOD;
    else if(index==3)assImg =  AssetsConst.WAIT_FOR_DELIVERY;
    else if(index==4)assImg =  AssetsConst.PAY;
    else if(index==5)assImg =  AssetsConst.EAT_ENJOY;

    return Container(
      child: Center(
        child: Image.asset(assImg, height: 64),
      ),
    );
  }
}

class _EndChildDelivery extends StatelessWidget {
  const _EndChildDelivery({
    Key key,
    @required this.text,
    @required this.current,
  }) : super(key: key);

  final String text;
  final bool current;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 150),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 100),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: getTxtColor(
                  msg: text,
                  textAlign: TextAlign.center,
                  fontSize: 16,
                  txtColor: current ? const Color(0xFF2ACA8E) : Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _IndicatorDelivery extends StatelessWidget {
  const _IndicatorDelivery({Key key, this.status}) : super(key: key);

  final _DeliveryStatus status;

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case _DeliveryStatus.done:
        return Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: const Center(
            child: Icon(Icons.check, color: Color(0xFF5D6173)),
          ),
        );
      case _DeliveryStatus.doing:
        return Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF2ACA8E),
          ),
          child: const Center(
            child: SizedBox(
              height: 15,
              width: 15,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          ),
        );
      case _DeliveryStatus.todo:
        return Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF747888),
          ),
          child: Center(
            child: Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF5D6173),
              ),
            ),
          ),
        );
    }
    return Container();
  }
}

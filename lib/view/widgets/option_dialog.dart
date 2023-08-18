import 'package:flutter/material.dart';
import 'package:flutterbeginner/model/bean/task_item.dart';

/// Author : Deepak Sharma(Webaddicted)
/// Email : deepaksharmatheboss@gmail.com
/// Profile : https://github.com/webaddicted
class OptionsDialog extends StatefulWidget {
  static const String path = "lib/src/pages/quiz_app/quiz_options.dart";
  final TaskItem category;

  const OptionsDialog({Key? key, required this.category}) : super(key: key);

  @override
  State<OptionsDialog> createState() => _OptionsDialogState();
}

class _OptionsDialogState extends State<OptionsDialog> {
  late int _noOfQuestions;
  late String _difficulty;
  late bool processing;

  @override
  void initState() {
    super.initState();
    _noOfQuestions = 10;
    _difficulty = "easy";
    processing = false;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            color: Colors.grey.shade200,
            child: Text(
              widget.category.title!,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(),
            ),
          ),
          const SizedBox(height: 10.0),
          const Text("Select Total Number of Questions"),
          SizedBox(
            width: double.infinity,
            child: Wrap(
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              runSpacing: 16.0,
              spacing: 16.0,
              children: <Widget>[
                const SizedBox(width: 0.0),
                ActionChip(
                  label: const Text("10"),
                  labelStyle: const TextStyle(color: Colors.white),
                  backgroundColor: _noOfQuestions == 10
                      ? Colors.indigo
                      : Colors.grey.shade600,
                  onPressed: () => _selectNumberOfQuestions(10),
                ),
                ActionChip(
                  label: const Text("20"),
                  labelStyle: const TextStyle(color: Colors.white),
                  backgroundColor: _noOfQuestions == 20
                      ? Colors.indigo
                      : Colors.grey.shade600,
                  onPressed: () => _selectNumberOfQuestions(20),
                ),
                ActionChip(
                  label: const Text("30"),
                  labelStyle: const TextStyle(color: Colors.white),
                  backgroundColor: _noOfQuestions == 30
                      ? Colors.indigo
                      : Colors.grey.shade600,
                  onPressed: () => _selectNumberOfQuestions(30),
                ),
                ActionChip(
                  label: const Text("40"),
                  labelStyle: const TextStyle(color: Colors.white),
                  backgroundColor: _noOfQuestions == 40
                      ? Colors.indigo
                      : Colors.grey.shade600,
                  onPressed: () => _selectNumberOfQuestions(40),
                ),
                ActionChip(
                  label: const Text("50"),
                  labelStyle: const TextStyle(color: Colors.white),
                  backgroundColor: _noOfQuestions == 50
                      ? Colors.indigo
                      : Colors.grey.shade600,
                  onPressed: () => _selectNumberOfQuestions(50),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          const Text("Select Difficulty"),
          SizedBox(
            width: double.infinity,
            child: Wrap(
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              runSpacing: 16.0,
              spacing: 16.0,
              children: <Widget>[
                const SizedBox(width: 0.0),
                ActionChip(
                  label: const Text("Any"),
                  labelStyle: const TextStyle(color: Colors.white),
                  backgroundColor: _difficulty == null
                      ? Colors.indigo
                      : Colors.grey.shade600,
                  onPressed: () => _selectDifficulty(null!),
                ),
                ActionChip(
                  label: const Text("Easy"),
                  labelStyle: const TextStyle(color: Colors.white),
                  backgroundColor: _difficulty == "easy"
                      ? Colors.indigo
                      : Colors.grey.shade600,
                  onPressed: () => _selectDifficulty("easy"),
                ),
                ActionChip(
                  label: const Text("Medium"),
                  labelStyle: const TextStyle(color: Colors.white),
                  backgroundColor: _difficulty == "medium"
                      ? Colors.indigo
                      : Colors.grey.shade600,
                  onPressed: () => _selectDifficulty("medium"),
                ),
                ActionChip(
                  label: const Text("Hard"),
                  labelStyle: const TextStyle(color: Colors.white),
                  backgroundColor: _difficulty == "hard"
                      ? Colors.indigo
                      : Colors.grey.shade600,
                  onPressed: () => _selectDifficulty("hard"),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          processing
              ? const CircularProgressIndicator()
              : MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  onPressed: _startQuiz,
                  child: const Text("Start Quiz"),
                ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }

  _selectNumberOfQuestions(int i) {
    setState(() {
      _noOfQuestions = i;
    });
  }

  _selectDifficulty(String s) {
    setState(() {
      _difficulty = s;
    });
  }

  void _startQuiz() async {
    setState(() {
      processing = true;
    });

    // List<Question> questions = demoQuestions;
    Navigator.pop(context);
    // Navigator.push(context, MaterialPageRoute(
    //     builder: (_) => QuizPage(questions: questions, category: widget.category,)
    // ));
    setState(() {
      processing = false;
    });
  }
}

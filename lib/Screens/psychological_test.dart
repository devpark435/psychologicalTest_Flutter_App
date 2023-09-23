import 'package:flutter/material.dart';
import 'package:psychologicaltest_flutter_app/model/PsychologicalTest_model.dart';

class PsychologicalTestScreen extends StatefulWidget {
  const PsychologicalTestScreen({super.key, required this.quizData});
  final PsychologicalTestModel quizData;

  @override
  State<PsychologicalTestScreen> createState() =>
      _PsychologicalTestScreenState();
}

class _PsychologicalTestScreenState extends State<PsychologicalTestScreen> {
  int currentQuestionIndex = 0;

  void nextQuestion() {
    if (currentQuestionIndex < widget.quizData.question.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      Navigator.pushNamed(context, '/result');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: LinearProgressIndicator(
                      value: (currentQuestionIndex + 1) /
                          widget.quizData.question.length),
                ),
              )),
          Expanded(
              flex: 2,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    widget.quizData.question[currentQuestionIndex].questionText,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .apply(fontWeightDelta: 5),
                  ),
                ),
              )),
          Expanded(
              flex: 2,
              child: SizedBox.expand(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Column(
                        children: widget.quizData.question[currentQuestionIndex]
                            .choices.entries
                            .map((e) => Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: InkWell(
                                      onTap: () => nextQuestion(),
                                      customBorder: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: Ink(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .5,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey.shade200,
                                        ),
                                        child: Center(
                                          child: Text(
                                            e.key,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .apply(fontWeightDelta: 3),
                                          ),
                                        ),
                                      )),
                                ))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ))
        ],
      )),
    );
  }
}

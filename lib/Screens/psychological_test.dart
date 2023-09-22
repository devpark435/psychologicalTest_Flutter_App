import 'package:flutter/material.dart';
import 'package:psychologicaltest_flutter_app/Screens/psychological_result.dart';
import 'package:psychologicaltest_flutter_app/model/Qustion_model.dart';

class PsychologicalTestScreen extends StatefulWidget {
  const PsychologicalTestScreen({super.key});

  @override
  State<PsychologicalTestScreen> createState() =>
      _PsychologicalTestScreenState();
}

class _PsychologicalTestScreenState extends State<PsychologicalTestScreen> {
  int currentQuestionIndex = 0;

  List<Question> questions = [
    Question(questionText: '당신은 고양이를 좋아합니까?', choices: ['예', '아니요']),
    Question(questionText: '당신은 개를 좋아합니까?', choices: ['예', '아니요']),
    Question(questionText: '당신은 커피를 좋아합니까?', choices: ['예', '아니요']),
    // 여기에 더 많은 질문 추가 가능...
  ];

  void nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
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
                      value: (currentQuestionIndex + 1) / questions.length),
                ),
              )),
          Expanded(
              flex: 2,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    questions[currentQuestionIndex].questionText,
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
                      child: InkWell(
                          onTap: () => nextQuestion(),
                          customBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Ink(
                            width: MediaQuery.of(context).size.width * .5,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade200,
                            ),
                            child: Center(
                              child: Text(
                                  questions[currentQuestionIndex].choices[0],
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .apply(fontWeightDelta: 3)),
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: InkWell(
                          onTap: () => nextQuestion(),
                          customBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Ink(
                            width: MediaQuery.of(context).size.width * .5,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade200,
                            ),
                            child: Center(
                              child: Text(
                                  questions[currentQuestionIndex].choices[1],
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .apply(fontWeightDelta: 3)),
                            ),
                          )),
                    ),
                  ],
                ),
              ))
        ],
      )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:psychologicaltest_flutter_app/Screens/psychological_result.dart';
import 'package:psychologicaltest_flutter_app/Widgets/choice_button.dart';
import 'package:psychologicaltest_flutter_app/model/PsychologicalTest_model.dart';
import 'package:psychologicaltest_flutter_app/model/Result_model.dart';

class PsychologicalTestScreen extends StatefulWidget {
  const PsychologicalTestScreen({super.key, required this.quizData});
  final PsychologicalTestModel quizData;

  @override
  State<PsychologicalTestScreen> createState() =>
      _PsychologicalTestScreenState();
}

class _PsychologicalTestScreenState extends State<PsychologicalTestScreen>
    with TickerProviderStateMixin {
  int totalScore = 0;
  int currentQuestionIndex = 0;
  late List<AnimationController> animationController;

  List<Animation<double>> animations = [];

  @override
  void initState() {
    super.initState();
    animationController = List.generate(
        3,
        (index) => AnimationController(
              duration: const Duration(milliseconds: 500),
              vsync: this,
            )..addListener(() {
                setState(() {});
              }));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (animations.isEmpty) {
      animations = List.generate(
          3,
          (index) =>
              Tween<double>(begin: MediaQuery.of(context).size.width, end: .0)
                  .animate(animationController[index]));
      for (int i = 0; i < animationController.length; i++) {
        Future.delayed(Duration(milliseconds: i * 300),
            () => animationController[i].forward());
      }
    }
  }

  @override
  void dispose() {
    for (var controller in animationController) {
      controller.dispose();
    }
    super.dispose();
  }

  void navigateBasedOnScore(int score) {
    Result selectedResult;
    if (score >= 260) {
      selectedResult = widget.quizData.results[4];
    } else if (score >= 240) {
      selectedResult = widget.quizData.results[3];
    } else if (score >= 210) {
      selectedResult = widget.quizData.results[2];
    } else if (score >= 180) {
      selectedResult = widget.quizData.results[1];
    } else {
      selectedResult = widget.quizData.results[0];
    }
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PsychologicalResultScreen(
                  result: selectedResult,
                )));
  }

  void nextQuestion() {
    setState(() {
      currentQuestionIndex++;
      for (int i = 0; i < animationController.length; i++) {
        animationController[i].reset();
        Future.delayed(Duration(milliseconds: i * 300),
            () => animationController[i].forward());
      }
    });
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
                  child: Transform.translate(
                    offset: Offset(animations[0].value, 0),
                    child: Text(
                      widget
                          .quizData.question[currentQuestionIndex].questionText,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge!.apply(
                            fontWeightDelta: 5,
                          ),
                    ),
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
                          children: widget.quizData
                              .question[currentQuestionIndex].choices.entries
                              .toList()
                              .asMap()
                              .entries
                              .map((e) => Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Transform.translate(
                                      offset: Offset(
                                          animations[e.key + 1].value, 0),
                                      child: ChoiceButton(
                                        answerText: e.value.key,
                                        onTap: () {
                                          setState(() {
                                            totalScore += e.value.value;
                                          });

                                          if (currentQuestionIndex ==
                                              widget.quizData.question.length -
                                                  1) {
                                            navigateBasedOnScore(totalScore);
                                            debugPrint("$totalScore");
                                          } else {
                                            nextQuestion();
                                          }
                                        },
                                      ))))
                              .toList(),
                        )),
                  ],
                ),
              ))
        ],
      )),
    );
  }
}

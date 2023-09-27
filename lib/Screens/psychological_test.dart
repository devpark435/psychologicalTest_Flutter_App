import 'package:flutter/material.dart';
import 'package:psychologicaltest_flutter_app/model/PsychologicalTest_model.dart';

class PsychologicalTestScreen extends StatefulWidget {
  const PsychologicalTestScreen({super.key, required this.quizData});
  final PsychologicalTestModel quizData;

  @override
  State<PsychologicalTestScreen> createState() =>
      _PsychologicalTestScreenState();
}

class _PsychologicalTestScreenState extends State<PsychologicalTestScreen>
    with TickerProviderStateMixin {
  int currentQuestionIndex = 0;
  late List<AnimationController> animationController;

  List<Animation<double>> animations = [];

  @override
  void initState() {
    super.initState();
    animationController = List.generate(
        3,
        (index) => AnimationController(
              duration: const Duration(milliseconds: 1000),
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
        Future.delayed(Duration(milliseconds: i * 500),
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

  void nextQuestion() {
    if (currentQuestionIndex < widget.quizData.question.length - 1) {
      setState(() {
        currentQuestionIndex++;
        for (int i = 0; i < animationController.length; i++) {
          animationController[i].reset();
          Future.delayed(Duration(milliseconds: i * 500),
              () => animationController[i].forward());
        }
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
                  child: Transform.translate(
                    offset: Offset(animations[0].value, 0),
                    child: Text(
                      widget
                          .quizData.question[currentQuestionIndex].questionText,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .apply(fontWeightDelta: 5),
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
                        children: widget.quizData.question[currentQuestionIndex]
                            .choices.entries
                            .toList()
                            .asMap()
                            .entries
                            .map((e) => Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Transform.translate(
                                  offset:
                                      Offset(animations[e.key + 1].value, 0),
                                  child: InkWell(
                                      onTap: () => nextQuestion(),
                                      customBorder: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: Ink(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .5,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primaryContainer,
                                        ),
                                        child: Center(
                                          child: Text(
                                            e.value.key,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .apply(fontWeightDelta: 3),
                                          ),
                                        ),
                                      )),
                                )))
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

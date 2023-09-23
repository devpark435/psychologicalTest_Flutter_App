import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psychologicaltest_flutter_app/Screens/entry_test.dart';

import '../provider/Quiz_provider.dart';

Widget weeklyCard(size, context, index) {
  var quizProvider = Provider.of<QuizProvider>(
    context,
  );

  final quiz = quizProvider.quizzes[index];
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: SizedBox(
        width: size,
        height: size,
        child: Stack(
          children: [
            Column(children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25))),
                  )),
              Expanded(
                  flex: 1,
                  child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25))),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: ListTile(
                              title: Text(
                                quiz.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .apply(fontWeightDelta: 2),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 20.0, bottom: 10),
                                child: Text(
                                  "조회수 ${quiz.view}",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )))
            ]),
            Positioned(
                top: size / 2 - 10,
                left: 10,
                child: Text(
                  "${quiz.id + 1}",
                  style: Theme.of(context).textTheme.displayMedium!.apply(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontWeightDelta: 3,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.5),
                        offset: const Offset(2, 2),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                )),
            Positioned(
              top: 10,
              right: 20,
              child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(color: Colors.blue.shade300, width: 2)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 3.0, horizontal: 5),
                      child: Text(
                        "심리테스트",
                        style: Theme.of(context).textTheme.labelSmall!.apply(
                            color: Colors.blue.shade300, fontWeightDelta: 2),
                      ),
                    ),
                  )),
            )
          ],
        ),
      ),
    ),
  );
}

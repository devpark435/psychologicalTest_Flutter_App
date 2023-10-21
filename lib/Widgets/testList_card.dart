import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psychologicaltest_flutter_app/provider/Quiz_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psychologicaltest_flutter_app/Screens/entry_test.dart';
import 'package:psychologicaltest_flutter_app/Widgets/device_checker.dart';
import '../provider/Quiz_provider.dart';

class TestListCard extends StatefulWidget {
  final size;
  final context;
  final index;

  TestListCard(this.size, this.context, this.index);

  @override
  _TestListCardState createState() => _TestListCardState();
}

class _TestListCardState extends State<TestListCard> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    var quizProvider = Provider.of<QuizProvider>(
      context,
    );

    final quiz = quizProvider.quizzes[widget.index];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: GestureDetector(
        onTap: () async {
          await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EntryTestScreen(
                        quizData: quizProvider.quizzes[widget.index],
                      )));
        },
        child: DeviceChecker().isMobileDevice
            ? AnimatedContainer(
                duration: Duration(milliseconds: 200),
                width: _isHovering ? widget.size + 10 : widget.size,
                height: _isHovering ? widget.size + 10 : widget.size,
                child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: SizedBox(
                      width: _isHovering ? widget.size + 10 : widget.size,
                      height: _isHovering ? widget.size + 10 : widget.size,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(quiz.imagePath),
                                    fit: BoxFit.fill),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: double.infinity, // 가로로 꽉 차게 설정
                              height: widget.size * .30, // 원하는 높이 설정
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20))),
                            ),
                          ),
                          Positioned(
                              bottom: widget.size * .20,
                              left: 5,
                              child: Text(
                                "${quiz.id + 1}",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .apply(
                                  color: Colors.white,
                                  fontStyle: FontStyle.italic,
                                  fontWeightDelta: 5,
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
                                      border: Border.all(
                                          color: Colors.blue.shade300,
                                          width: 2)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 3.0, horizontal: 5),
                                    child: Text(
                                      "심리테스트",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall!
                                          .apply(
                                              color: Colors.blue.shade300,
                                              fontWeightDelta: 2),
                                    ),
                                  ),
                                )),
                          )
                        ],
                      ),
                    )),
              )
            : SizedBox(
                width: widget.size,
                height: widget.size,
                child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(quiz.imagePath),
                                  fit: BoxFit.fill),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: double.infinity, // 가로로 꽉 차게 설정
                            height: widget.size * .30, // 원하는 높이 설정
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20))),
                          ),
                        ),
                        Positioned(
                            bottom: widget.size * .20,
                            left: 5,
                            child: Text(
                              "${quiz.id + 1}",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .apply(
                                color: Colors.white,
                                fontStyle: FontStyle.italic,
                                fontWeightDelta: 5,
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
                                    border: Border.all(
                                        color: Colors.blue.shade300, width: 2)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 3.0, horizontal: 5),
                                  child: Text(
                                    "심리테스트",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall!
                                        .apply(
                                            color: Colors.blue.shade300,
                                            fontWeightDelta: 2),
                                  ),
                                ),
                              )),
                        )
                      ],
                    )),
              ),
      ),
    );
  }
}

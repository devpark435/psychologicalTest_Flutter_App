import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psychologicaltest_flutter_app/Screens/entry_test.dart';
import 'package:psychologicaltest_flutter_app/Widgets/device_checker.dart';
import '../provider/Quiz_provider.dart';

class WeeklyCard extends StatefulWidget {
  final size;
  final context;
  final index;

  WeeklyCard(this.size, this.context, this.index);

  @override
  _WeeklyCardState createState() => _WeeklyCardState();
}

class _WeeklyCardState extends State<WeeklyCard>
    with SingleTickerProviderStateMixin {
  bool _isHovering = false;

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2), // You can adjust the duration here
      vsync: this,
    );

    // Initialize animation with default value.
    _animation = Tween<double>(begin: -5, end: 5)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      });

    // Start the animation.
    // Repeat the animation indefinitely.
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    super.dispose();
    // Don't forget to dispose of the controller when you're done!
    _controller.dispose();
  }

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
        child: MouseRegion(
          onEnter: (_) => setState(() {
            _isHovering = true;
          }),
          onExit: (_) => setState(() {
            _isHovering = false;
          }),
          child: DeviceChecker().isMobileDevice
              ? Transform.translate(
                  offset: Offset(0, _animation.value),
                  child: Card(
                      elevation: 3,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: SizedBox(
                        width:
                            _isHovering ? widget.size + 10 : widget.size - 20,
                        height:
                            _isHovering ? widget.size + 10 : widget.size - 20,
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                quiz.imagePath,
                                fit: BoxFit.fill,
                              ),
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
              : AnimatedContainer(
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
                            Positioned(
                                bottom: 0,
                                // DeviceChecker().isMobileDevice
                                //     ? size / 2 - 10
                                //     : size / 2 + 20,

                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  width: _isHovering
                                      ? widget.size + 10
                                      : widget.size,
                                  height: widget.size * .3,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(25))),
                                )),
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
                ),
        ),
      ),
    );
  }
}

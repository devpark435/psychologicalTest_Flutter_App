import 'package:flutter/material.dart';
import 'package:psychologicaltest_flutter_app/Screens/psychological_test.dart';
import 'package:psychologicaltest_flutter_app/Widgets/chips.dart';
import 'package:psychologicaltest_flutter_app/Widgets/device_checker.dart';
import 'package:psychologicaltest_flutter_app/model/PsychologicalTest_model.dart';

class EntryTestScreen extends StatefulWidget {
  const EntryTestScreen({
    super.key,
    required this.quizData,
  });
  final PsychologicalTestModel quizData;

  @override
  State<EntryTestScreen> createState() => _EntryTestScreenState();
}

class _EntryTestScreenState extends State<EntryTestScreen>
    with TickerProviderStateMixin {
  late List<AnimationController> animationController;

  List<Animation<double>> animations = [];

  @override
  void initState() {
    super.initState();
    animationController = List.generate(
        5,
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
          4,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            height: DeviceChecker().isMobileDevice ? double.infinity : 1080,
            child: Center(
              child: SizedBox(
                width: DeviceChecker().isMobileDevice
                    ? double.infinity
                    : MediaQuery.of(context).size.width * .7,
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Transform.translate(
                          offset: Offset(animations[0].value, 0),
                          child: Text(
                            widget.quizData.title,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .apply(fontWeightDelta: 3),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 20),
                        child: Transform.translate(
                          offset: Offset(animations[1].value, 0),
                          child: Container(
                            width: 500,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(widget.quizData.imagePath),
                                  fit: BoxFit.fitWidth),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Transform.translate(
                        offset: Offset(animations[2].value, 0),
                        child: Wrap(
                          spacing: 8.0,
                          runSpacing: 4.0,
                          children: <Widget>[
                            for (var i = 0; i < widget.quizData.tag.length; i++)
                              buildChip(widget.quizData.tag[i]),
                          ],
                        ),
                      ),
                    ),
                    const Expanded(flex: 1, child: SizedBox.expand()),
                  ],
                ),
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Transform.translate(
          offset: Offset(animations[3].value, 0),
          child: InkWell(
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Ink(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.blueAccent,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.blueAccent,
                        blurRadius: 5,
                        offset: Offset(0, 3))
                  ]),
              child: Center(
                child: Text(
                  "테스트 시작하기",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .apply(color: Colors.white, fontWeightDelta: 3),
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PsychologicalTestScreen(
                            quizData: widget.quizData,
                          )));
            },
          ),
        ));
  }
}

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

class _WeeklyCardState extends State<WeeklyCard> {
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
        child: MouseRegion(
          onEnter: (_) => setState(() {
            _isHovering = true;
          }),
          onExit: (_) => setState(() {
            _isHovering = false;
          }),
          child: AnimatedContainer(
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
                            duration: Duration(milliseconds: 200),
                            width: _isHovering ? widget.size + 10 : widget.size,
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
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
// return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 20.0),
//     child: Card(
//       elevation: 3,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//       child: SizedBox(
//         width: size,
//         height: size,
//         child: Stack(
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                   image: DecorationImage(
//                       image: AssetImage(quiz.imagePath), fit: BoxFit.fill),
//                   borderRadius: BorderRadius.circular(20)),
//             ),
//             Positioned(
//                 bottom: 0,
//                 // DeviceChecker().isMobileDevice
//                 //     ? size / 2 - 10
//                 //     : size / 2 + 20,

//                 child: Container(
//                   width: size,
//                   height: size * .3,
//                   decoration: const BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.only(
//                           bottomLeft: Radius.circular(20),
//                           bottomRight: Radius.circular(20))),
//                 )),
//             Positioned(
//                 bottom: size * .20,
//                 left: 5,
//                 child: Text(
//                   "${quiz.id + 1}",
//                   style: Theme.of(context).textTheme.displayMedium!.apply(
//                     color: Colors.white,
//                     fontStyle: FontStyle.italic,
//                     fontWeightDelta: 5,
//                     shadows: [
//                       Shadow(
//                         color: Colors.black.withOpacity(0.5),
//                         offset: const Offset(2, 2),
//                         blurRadius: 4,
//                       ),
//                     ],
//                   ),
//                 )),
//             Positioned(
//               top: 10,
//               right: 20,
//               child: Padding(
//                   padding: const EdgeInsets.only(left: 20.0),
//                   child: Container(
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         border:
//                             Border.all(color: Colors.blue.shade300, width: 2)),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 3.0, horizontal: 5),
//                       child: Text(
//                         "심리테스트",
//                         style: Theme.of(context).textTheme.labelSmall!.apply(
//                             color: Colors.blue.shade300, fontWeightDelta: 2),
//                       ),
//                     ),
//                   )),
//             )
//           ],
//         ),
//       ),
//     ),
//   );
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
                            duration: const Duration(milliseconds: 200),
                            width: MediaQuery.of(context).size.width,
                            height: widget.size * .30,
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
// class TestListCard extends StatefulWidget {
//   const TestListCard({super.key, required this.context, required this.width});
//   final context;
//   final width;

//   @override
//   State<TestListCard> createState() => _TestListCardState();
// }

// class _TestListCardState extends State<TestListCard> {
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     var quizProvider = Provider.of<QuizProvider>(
//       context,
//     );
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Card(
//         elevation: 1,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
//         child: SizedBox(
//           width: widget.width > size.width * .8
//               ? size.width * .2
//               : size.width * .9,
//           child: Column(
//             children: [
//               Expanded(
//                 flex: 2,
//                 child: Container(
//                     decoration: const BoxDecoration(
//                         color: Colors.amber,
//                         borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(25),
//                             topRight: Radius.circular(25)))),
//               ),
//               Expanded(
//                   flex: 1,
//                   child: Container(
//                     decoration: const BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.only(
//                             bottomLeft: Radius.circular(25),
//                             bottomRight: Radius.circular(25))),
//                     child: ListTile(
//                       title: Text(
//                         '테스트 이름 ',
//                         style: Theme.of(context)
//                             .textTheme
//                             .titleLarge!
//                             .apply(fontWeightDelta: 2),
//                       ),
//                       subtitle: Text('테스트 세부 설명',
//                           style: Theme.of(context).textTheme.bodyLarge),
//                       trailing: const Icon(Icons.share),
//                     ),
//                   ))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

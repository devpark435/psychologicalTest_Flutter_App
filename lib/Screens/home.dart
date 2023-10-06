import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psychologicaltest_flutter_app/Screens/entry_test.dart';
import 'package:psychologicaltest_flutter_app/Widgets/device_checker.dart';
import 'package:psychologicaltest_flutter_app/Widgets/search.dart';
import 'package:psychologicaltest_flutter_app/Widgets/testList_card.dart';
import 'package:psychologicaltest_flutter_app/Widgets/weekly_card.dart';
import 'package:psychologicaltest_flutter_app/provider/Quiz_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var quizProvider = Provider.of<QuizProvider>(context, listen: false);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          DeviceChecker().isMobileDevice ? 'Mobile Web' : 'Web',
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .apply(fontWeightDelta: 5),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                  context: context,
                  delegate: QuizSearchDelegate(quizProvider.quizzes));
            },
            icon: const Icon(
              Icons.search,
              size: 32,
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.list,
                size: 32,
              ))
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<QuizProvider>(context, listen: false).loadQuizzes(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Consumer<QuizProvider>(
              builder: (context, quizProvider, child) {
                if (quizProvider.quizzes.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return SafeArea(
                      child: Column(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              Column(
                                children: [
                                  Expanded(
                                      flex: 2,
                                      child: Container(
                                        color: Colors.blue.shade300,
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                        color: Colors.transparent,
                                      ))
                                ],
                              ),
                              SizedBox(
                                height: DeviceChecker().isMobileDevice
                                    ? size.height * 0.25
                                    : size.height * 0.3,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: quizProvider.quizzes.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var size =
                                        MediaQuery.of(context).size.height *
                                            0.25;
                                    return GestureDetector(
                                      onTap: () async {
                                        await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EntryTestScreen(
                                                      quizData: quizProvider
                                                          .quizzes[index],
                                                    )));
                                        quizProvider.updateViews(index);
                                      },
                                      child: weeklyCard(size, context, index),
                                    );
                                  },
                                ),
                              )
                            ],
                          )),
                      Expanded(
                          flex: 1,
                          child: ScrollConfiguration(
                            behavior: MyCustomScrollBehavior(),
                            child: ListView.separated(
                              scrollDirection: size.width > 400
                                  ? Axis.horizontal
                                  : Axis.vertical,
                              itemCount: 6,
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const Divider(),
                              itemBuilder: (BuildContext context, int index) {
                                return SizedBox(
                                    width: size.width > 400
                                        ? 400
                                        : size.width * .9,
                                    height: size.height > 900
                                        ? 400
                                        : size.height * .3,
                                    child: testListCard(context, size.width));
                              },
                            ),
                          ))
                    ],
                  ));
                }
              },
            );
          }
        },
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}
// FutureBuilder(
//             future: quizProvider.loadQuizzes(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Center(child: CircularProgressIndicator());
//               } else if (snapshot.hasError) {
//                 return const Center(child: Text('Error'));
//               } else {
//                 return SafeArea(
//                     child: Column(
//                   children: [
//                     Expanded(
//                         flex: 1,
//                         child: Stack(
//                           alignment: Alignment.centerLeft,
//                           children: [
//                             Column(
//                               children: [
//                                 Expanded(
//                                     flex: 2,
//                                     child: Container(
//                                       color: Colors.blue.shade300,
//                                     )),
//                                 Expanded(
//                                     flex: 1,
//                                     child: Container(
//                                       color: Colors.transparent,
//                                     ))
//                               ],
//                             ),
//                             SizedBox(
//                               height: MediaQuery.of(context).size.height * 0.25,
//                               child: ListView.builder(
//                                 scrollDirection: Axis.horizontal,
//                                 itemCount: quizProvider.quizzes.length,
//                                 itemBuilder: (BuildContext context, int index) {
//                                   var size =
//                                       MediaQuery.of(context).size.height * 0.25;
//                                   return GestureDetector(
//                                     onTap: () async {
//                                       await Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                               builder: (context) =>
//                                                   EntryTestScreen(
//                                                     quizData: quizProvider
//                                                         .quizzes[index],
//                                                   )));
//                                       quizProvider.updateViews(index);
//                                     },
//                                     child: weeklyCard(size, context, index),
//                                   );
//                                 },
//                               ),
//                             )
//                           ],
//                         )),
//                     Expanded(
//                         flex: 1,
//                         child: ScrollConfiguration(
//                           behavior: MyCustomScrollBehavior(),
//                           child: ListView.separated(
//                             scrollDirection: size.width > 400
//                                 ? Axis.horizontal
//                                 : Axis.vertical,
//                             itemCount: 6,
//                             separatorBuilder:
//                                 (BuildContext context, int index) =>
//                                     const Divider(),
//                             itemBuilder: (BuildContext context, int index) {
//                               return SizedBox(
//                                   width: 300,
//                                   // size.width > 400 ? 400 : size.width * .9,
//                                   height: 300,
//                                   // size.height > 900
//                                   //     ? 400
//                                   //     : size.height * .3,
//                                   child: testListCard(context, size.width));
//                             },
//                           ),
//                         ))
//                   ],
//                 ));
//               }
//             })
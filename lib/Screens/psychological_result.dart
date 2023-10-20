import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:psychologicaltest_flutter_app/Widgets/device_checker.dart';
import 'package:psychologicaltest_flutter_app/model/PsychologicalTest_model.dart';
import 'package:share/share.dart';

class PsychologicalResultScreen extends StatelessWidget {
  const PsychologicalResultScreen({super.key, required this.result});
  final Result result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
          child: SizedBox(
            width: DeviceChecker().isMobileDevice
                ? MediaQuery.of(context).size.width * 0.9
                : MediaQuery.of(context).size.width / 2,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Padding(
                //   padding: const EdgeInsets.all(10.0),
                //   child: Text(
                //     result.title,
                //     style: Theme.of(context)
                //         .textTheme
                //         .titleLarge!
                //         .apply(fontWeightDelta: 5),
                //   ),
                // ),
                Expanded(flex: 1, child: SizedBox.expand()),

                Expanded(
                  flex: 2,
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: DeviceChecker().isMobileDevice
                            ? MediaQuery.of(context).size.width * .9
                            : 500,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(result.imagePath),
                              fit: BoxFit.fitWidth
                              // DeviceChecker().isMobileDevice
                              //     ? BoxFit.fitWidth
                              //     : BoxFit.cover,
                              ),
                        ),
                      )),
                ),
                Expanded(flex: 1, child: SizedBox.expand()),
                // kIsWeb
                //     ? Padding(
                //         padding: const EdgeInsets.all(10.0),
                //         child: ElevatedButton(
                //           onPressed: () {},
                //           child: Text("share"),
                //         ))
                //     : Padding(
                //         padding: const EdgeInsets.all(10.0),
                //         child: ElevatedButton(
                //           onPressed: () {
                //             Share.share('https://www.example.com');
                //           },
                //           child: Text("share"),
                //         )),
              ],
            ),
          ),
        )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: InkWell(
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
                "홈으로 돌아가기",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .apply(color: Colors.white, fontWeightDelta: 3),
              ),
            ),
          ),
          onTap: () {
            Navigator.popUntil(context, (route) => route.isFirst);
          },
        ));
  }
}

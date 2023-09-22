import 'package:flutter/material.dart';
import 'package:psychologicaltest_flutter_app/Widgets/chips.dart';

class EntryTestScreen extends StatelessWidget {
  const EntryTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Center(
                      child: Text(
                        "테스트 이름",
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
                    child: Container(
                        color: Colors.amber,
                        child: Center(
                          child: Text("테스트 이미지 공간"),
                        )),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 20),
                    child: Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "테스트 추가 설명 어쩌고 저쩌고 ..................",
                          style: Theme.of(context).textTheme.bodyLarge!.apply(
                              fontWeightDelta: 2, color: Colors.grey.shade700),
                        )),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Wrap(
                    // Wrap 위젯으로 여러개의 Chip을 한 줄에 표시하고, 자동으로 줄바꿈되도록 합니다.
                    spacing: 8.0, // 각 Chip 사이의 공간 설정
                    runSpacing: 4.0, // 각 줄 사이의 공간 설정
                    children: <Widget>[
                      buildChip('# Flutter'),
                      buildChip('# Dart'),
                      buildChip('# OpenAI'),
                      buildChip('# GPT4'),
                      // 필요한 만큼 Chip 추가 가능...
                    ],
                  ),
                ),
                const Expanded(flex: 1, child: SizedBox.expand()),
              ],
            ),
          ),
        ),
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
                "테스트 시작하기",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .apply(color: Colors.white, fontWeightDelta: 3),
              ),
            ),
          ),
          onTap: () {
            Navigator.pushNamed(context, '/test');
          },
        ));
  }
}

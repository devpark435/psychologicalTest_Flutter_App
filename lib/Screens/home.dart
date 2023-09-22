import 'package:flutter/material.dart';
import 'package:psychologicaltest_flutter_app/Widgets/testList_card.dart';
import 'package:psychologicaltest_flutter_app/Widgets/weekly_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            'Title',
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .apply(fontWeightDelta: 5),
          ),
          actions: [
            IconButton(
              onPressed: () {},
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
        body: SafeArea(
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
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          var size = MediaQuery.of(context).size.height * 0.25;
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/entry');
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
                child: ListView.separated(
                  itemCount: 5,
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                  itemBuilder: (BuildContext context, int index) {
                    return testListCard(context);
                  },
                ))
          ],
        )));
  }
}

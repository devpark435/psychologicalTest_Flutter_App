import 'package:flutter/material.dart';

Widget weeklyCard(size, context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: SizedBox(
        width: size,
        height: size,
        child: Column(children: [
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
                            "테스트 이름",
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
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: InkWell(
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
                                            .apply(color: Colors.blue.shade300),
                                      ),
                                    ),
                                  ),
                                  onTap: () {},
                                ))),
                      )
                    ],
                  )))
        ]),
      ),
    ),
  );
}

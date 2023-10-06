import 'package:flutter/material.dart';

Widget testListCard(
  context,
  width,
) {
  final size = MediaQuery.of(context).size;
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: SizedBox(
        width: width > size.width * .8 ? size.width * .2 : size.width * .9,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25)))),
            ),
            Expanded(
                flex: 1,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25))),
                  child: ListTile(
                    title: Text(
                      '테스트 이름 ',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .apply(fontWeightDelta: 2),
                    ),
                    subtitle: Text('테스트 세부 설명',
                        style: Theme.of(context).textTheme.bodyLarge),
                    trailing: const Icon(Icons.share),
                  ),
                ))
          ],
        ),
      ),
    ),
  );
}

import 'package:flutter/material.dart';

Widget buildChip(String label) {
  return Chip(
    shape: RoundedRectangleBorder(
      side: BorderSide.none,
      borderRadius: BorderRadius.circular(20), // 원하는 반경 값 설정
    ),
    elevation: 0,
    labelPadding: EdgeInsets.all(2.0),
    label: Text(label), // 전체 해시태그를 라벨로 표시합니다.
    backgroundColor:
        Color.fromRGBO(239, 241, 243, 1), // 배경색 지정 (원하는 색상으로 변경 가능)
  );
}

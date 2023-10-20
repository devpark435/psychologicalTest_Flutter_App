import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import 'package:psychologicaltest_flutter_app/model/PsychologicalTest_model.dart';

class QuizProvider with ChangeNotifier {
  // 퀴즈 목록을 저장할 변수
  List<PsychologicalTestModel> _quizzes = [];

  // 외부에서 접근 가능한 getter
  List<PsychologicalTestModel> get quizzes => _quizzes;

  // Json 파일 로드 및 파싱
  Future<void> loadQuizzes() async {
    String jsonString =
        await rootBundle.loadString('assets/json/PsychologicalTest.json');
    List<dynamic> raw = jsonDecode(jsonString);

    _quizzes = raw
        .map((quizJson) => PsychologicalTestModel.fromJson(quizJson))
        .toList();

    notifyListeners(); // UI 업데이트 요청
    debugPrint("quiz Data Load");
  }

  // void updateViews(int index) {
  //   _quizzes[index].view = (_quizzes[index].view+ 1); // 해당 퀴즈의 조회수 증가
  //   notifyListeners();
  // }
}

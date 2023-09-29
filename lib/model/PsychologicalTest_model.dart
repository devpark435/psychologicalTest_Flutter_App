import 'package:psychologicaltest_flutter_app/model/Result_model.dart';

class PsychologicalTestModel {
  final int id;
  final String title;
  final List<String> tag;
  final String imagePath;
  int? view;
  final List<Question> question;
  final List<Result> results;

  PsychologicalTestModel(
      {required this.id,
      required this.title,
      required this.tag,
      required this.view,
      required this.imagePath,
      required this.question,
      required this.results});

  factory PsychologicalTestModel.fromJson(Map<String, dynamic> json) {
    return PsychologicalTestModel(
      id: json['id'],
      title: json['title'],
      tag: List<String>.from(json['tag']),
      view: json['view'],
      imagePath: json['imagePath'],
      question:
          (json['question'] as List).map((i) => Question.fromJson(i)).toList(),
      results: (json['result'] as List).map((i) => Result.fromJson(i)).toList(),
    );
  }
}

class Question {
  final String questionText;
  final Map<String, int> choices;

  Question({required this.questionText, required this.choices});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      questionText: json['questionText'],
      choices: Map<String, int>.from(json['choices']),
    );
  }
}

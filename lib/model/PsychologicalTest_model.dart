class PsychologicalTestModel {
  final int id;
  final String title;
  final List<String> tag;
  final int view;
  final String imagePath;
  final List<Question> question;
  final List<Result> result;

  PsychologicalTestModel(
      {required this.id,
      required this.title,
      required this.tag,
      required this.view,
      required this.imagePath,
      required this.question,
      required this.result});

  factory PsychologicalTestModel.fromJson(Map<String, dynamic> json) {
    return PsychologicalTestModel(
      id: json['id'],
      title: json['title'],
      tag: List<String>.from(json['tag']),
      view: json['view'],
      imagePath: json['imagePath'],
      question:
          (json['question'] as List).map((i) => Question.fromJson(i)).toList(),
      result: (json['result'] as List).map((i) => Result.fromJson(i)).toList(),
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

class Result {
  final String title;
  final String content;
  final String imagePath;
  final List<int> scoreRange;

  Result(
      {required this.title,
      required this.content,
      required this.imagePath,
      required this.scoreRange});

  factory Result.fromJson(Map<String, dynamic> parsedJson) {
    return Result(
      title: parsedJson["title"],
      content: parsedJson["content"],
      imagePath: parsedJson["imagePath"],
      scoreRange: new List<int>.from(parsedJson["scoreRange"]),
    );
  }
}

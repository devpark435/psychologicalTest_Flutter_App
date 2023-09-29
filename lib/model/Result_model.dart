class Result {
  final String title;
  final String content;

  Result({required this.title, required this.content});

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(title: json["title"], content: json["content"]);
  }
}

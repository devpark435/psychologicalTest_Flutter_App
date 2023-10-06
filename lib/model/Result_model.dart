class Result {
  final String title;
  final String content;
  final String imagePath;

  Result({required this.title, required this.content, required this.imagePath});

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
        title: json["title"],
        content: json["content"],
        imagePath: json["imagePath"]);
  }
}

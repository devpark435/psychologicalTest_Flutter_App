import 'package:flutter/material.dart';
import 'package:psychologicaltest_flutter_app/Screens/entry_test.dart';
import 'package:psychologicaltest_flutter_app/model/PsychologicalTest_model.dart';

class QuizSearchDelegate extends SearchDelegate<PsychologicalTestModel> {
  final List<PsychologicalTestModel> quizzes;

  QuizSearchDelegate(this.quizzes);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        // close(context,null);
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final filteredQuizzes = quizzes
        .where((quiz) => quiz.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
        itemCount: filteredQuizzes.length,
        itemBuilder: (context, index) => ListTile(
              title: Text(filteredQuizzes[index].title),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          EntryTestScreen(quizData: filteredQuizzes[index]))),
            ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = quizzes
        .where((quiz) => quiz.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) =>
            ListTile(title: Text(suggestionList[index].title), onTap: () {}));
  }
}

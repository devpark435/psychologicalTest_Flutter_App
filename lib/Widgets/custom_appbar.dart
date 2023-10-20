import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psychologicaltest_flutter_app/Widgets/device_checker.dart';
import 'package:psychologicaltest_flutter_app/Widgets/search.dart';
import '../provider/Quiz_provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    var quizProvider = Provider.of<QuizProvider>(context, listen: false);
    return AppBar(
      centerTitle: false,
      title: Text(
        DeviceChecker().isMobileDevice ? 'Mobile Web' : 'Web',
        style: Theme.of(context)
            .textTheme
            .headlineLarge!
            .apply(fontWeightDelta: 5),
      ),
      actions: [
        IconButton(
          onPressed: () {
            showSearch(
                context: context,
                delegate: QuizSearchDelegate(quizProvider.quizzes));
          },
          icon: const Icon(
            Icons.search,
            size: 32,
          ),
        ),
      ],
    );
  }
}

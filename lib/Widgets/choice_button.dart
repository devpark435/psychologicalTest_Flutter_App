import 'package:flutter/material.dart';

class ChoiceButton extends StatefulWidget {
  final String answerText;
  final VoidCallback onTap;

  const ChoiceButton(
      {super.key, required this.answerText, required this.onTap});

  @override
  _ChoiceButtonState createState() => _ChoiceButtonState();
}

class _ChoiceButtonState extends State<ChoiceButton> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          isTapped = true;
        });
      },
      onTapUp: (details) async {
        await Future.delayed(const Duration(milliseconds: 200));
        setState(() {
          isTapped = false;
        });
        widget.onTap();
      },
      child: InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: MediaQuery.of(context).size.width *
                  (isTapped ? .8 : .7), // size increases when tapped
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: isTapped
                    ? Theme.of(context).colorScheme.primaryContainer
                    : Theme.of(context).colorScheme.primaryContainer,
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(widget.answerText,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .apply(fontWeightDelta: 3)),
                ),
              ))),
    );
  }
}

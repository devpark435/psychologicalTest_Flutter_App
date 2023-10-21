import 'package:flutter/material.dart';

class AnimatedProgressBar extends StatefulWidget {
  final double targetValue;
  final int questionLength;

  const AnimatedProgressBar(
      {Key? key, required this.targetValue, required this.questionLength})
      : super(key: key);

  @override
  _AnimatedProgressBarState createState() => _AnimatedProgressBarState();
}

class _AnimatedProgressBarState extends State<AnimatedProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 1), // You can adjust the duration here
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 0).animate(_controller);
  }

  @override
  void didUpdateWidget(covariant AnimatedProgressBar oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.targetValue != widget.targetValue) {
      // If the target value has changed.
      double start = oldWidget.targetValue / oldWidget.questionLength;
      double end = widget.targetValue / widget.questionLength;

      // Reset the controller before starting a new animation.
      _controller.reset();

      // Define a new animation.
      _animation = Tween<double>(
        begin: start,
        end: end,
      ).animate(_controller)
        ..addListener(() {
          setState(() {});
        });

      // Start the animation.
      _controller.forward();
    }
  }

  @override
  void dispose() {
    super.dispose();
    // Don't forget to dispose of the controller when you're done!
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: LinearProgressIndicator(
        value: _animation.value,
        backgroundColor: const Color(0xffD6D6D6),
      ),
    );
  }
}

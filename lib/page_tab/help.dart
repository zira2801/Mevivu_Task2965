import 'package:flutter/material.dart';

class HelpBuilder extends StatefulWidget {
  const HelpBuilder({super.key});

  @override
  State<HelpBuilder> createState() => _HelpBuilderState();
}

class _HelpBuilderState extends State<HelpBuilder>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

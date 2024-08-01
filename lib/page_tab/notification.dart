import 'package:flutter/material.dart';

class NotificationBuilder extends StatefulWidget {
  const NotificationBuilder({super.key});

  @override
  State<NotificationBuilder> createState() => _NotificationBuilderState();
}

class _NotificationBuilderState extends State<NotificationBuilder>
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

import 'package:flutter/material.dart';

class BookmarkBuilder extends StatefulWidget {
  const BookmarkBuilder({super.key});

  @override
  State<BookmarkBuilder> createState() => _BookmarkBuilderState();
}

class _BookmarkBuilderState extends State<BookmarkBuilder>
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

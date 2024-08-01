import 'package:flutter/material.dart';
import 'package:task_1/page/mainpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Task 2965',
      debugShowCheckedModeBanner: false,
      home: MyWidget(),
    );
  }
}


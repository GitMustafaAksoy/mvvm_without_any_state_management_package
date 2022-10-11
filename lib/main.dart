import 'package:flutter/material.dart';
import 'package:mvvm_without_any_state_management_package/pages/post/post_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MVVM Architecture Without Any State Management Package',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyPostPage(title: 'MVVM Without Any State Man. Package'),
    );
  }
}


library post_view;

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

part 'post_view_model.dart';

part '../../model/post_model.dart';

part 'post_view_model_body.dart';

class MyPostPage extends StatelessWidget {
  const MyPostPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: postViewBody(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.list),
        onPressed: () {
          _viewModel.getAllPosts();
        },
      ),
    );
  }
}

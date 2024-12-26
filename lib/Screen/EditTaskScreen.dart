

import 'package:demo_todo_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../component/appbar/buildSingleIconAppBar.dart';

class EditTaskScreen extends ConsumerWidget {
  final String taskId;

  EditTaskScreen({super.key, required this.taskId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: BuildSingleEventIconAppBar(titleText: 'Edit Task',
        leadingButton: Icons.arrow_back_ios_new_outlined,
        onPressedEvent: () {
        context.pop();
      },),
      body: Column(
      ),
    );
    throw UnimplementedError();
  }
}


import 'package:demo_todo_app/component/appbar/buildSingleIconAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DetailTaskScreen extends ConsumerWidget {
  final String taskId;

  DetailTaskScreen({super.key, required this.taskId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("this.taskId = taskID");
    return Scaffold(
      appBar: BuildSingleEventIconAppBar(titleText: 'Task',
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
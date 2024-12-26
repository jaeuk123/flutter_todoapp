import 'package:demo_todo_app/Utils/HexColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../component/Button/BuildRoundedTextButton.dart';
import '../component/appbar/buildSingleIconAppBar.dart';


final titleProvider  = StateProvider<String>((ref) {return "";});

final contentsProvider  = StateProvider<String>((ref) {return "";});

class AddTaskScreen extends ConsumerWidget {

  final titleController = TextEditingController();
  final contentsController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: BuildSingleEventIconAppBar(
        titleText: 'Add Task',
        leadingButton: Icons.arrow_back_ios_new_outlined,
        onPressedEvent: () {
          context.pop();
        },
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                onChanged: (value) {
                  ref.read(titleProvider.notifier).state = value;
                },
                decoration: InputDecoration(
                    hintText: "Title",
                    hintStyle: TextStyle(color: HexColor("#8B8787"))),
              ),
              SizedBox(height: 30),
              TextField(
                controller: contentsController,
                onChanged: (value) {
                  ref.read(contentsProvider.notifier).state = value;
                },
                decoration: InputDecoration(
                    hintText: "Detail",
                    hintStyle: TextStyle(color: HexColor("#8B8787"))),
              ),
              SizedBox(height: 30),
              RoundedTextButton(
                "ADD",
                onPressedEvent: context.pop,
                textBold: true,
              ),
            ],
          ),
        ),
      ),
    );
    throw UnimplementedError();
  }
}

import 'package:demo_todo_app/Screen/AddTaskScreen.dart';
import 'package:demo_todo_app/Screen/AppMainScreen.dart';
import 'package:demo_todo_app/Screen/EditTaskScreen.dart';
import 'package:demo_todo_app/Screen/DetailTaskScreen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'Routes/AppRoutes.dart';

void main() {
  final GoRouter router = setRouter();
  runApp(MyApp(router: router,));
}

class MyApp extends StatelessWidget {
  final GoRouter router;
  // const MyApp(GoRouter router, {super.key});

  const MyApp({required GoRouter this.router , super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: appMainScreen(),
    );
  }
}

//GoRouter
/*
* push - 새창띄우면서 화면 생성
* pop - 새창 띄워진거 젤최근 한개 삭제
* go - 이전 네비게이션 데이터 전부 삭제하고 화면전환
* replace - 현재 화면 대체
* goback - 이전화면이동
* */
GoRouter setRouter() {
  return GoRouter(routes: [
    GoRoute(path: AppRoutes.main,
        builder: (context,state) => appMainScreen()),
    GoRoute(path: AppRoutes.details+'/:taskId',
        builder: (context,state) => DetailTaskScreen(taskId: state.pathParameters['taskId']!,)),
    GoRoute(path: AppRoutes.addTask,
        builder: (context,state) => AddTaskScreen()),
    GoRoute(path: AppRoutes.editTask + '/:taskId',
        builder: (context,state) => EditTaskScreen(taskId: state.pathParameters['taskId']!,)),
  ]);
}
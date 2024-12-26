import 'dart:io';

import 'package:demo_todo_app/Routes/AppRoutes.dart';
import 'package:demo_todo_app/component/appbar/buildSingleIconAppBar.dart';
import 'package:demo_todo_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';

import '../Utils/HexColor.dart';

class appMainScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    Future<void> _requestPermission(Permission permission) async {
      final status = await permission.request();
      if (status.isGranted) {
        print('Permission granted!');
      } else if (status.isDenied) {
        print('Permission denied.');
      } else if (status.isPermanentlyDenied) {
        openAppSettings(); // 앱 설정 화면으로 이동
      }
    }

    // if(Platform.isAndroid)
    _requestPermission(Permission.notification); //퍼미션 요청

    return DefaultTabController( //
      length: 2,
      child: Scaffold(
        appBar: BuildSingleEventIconAppBar(
          titleText: "TODO APP",
          actionsButton: Icons.calendar_today_outlined,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {context.push(AppRoutes.addTask)},
          backgroundColor: HexColor("#9395D3"),
          shape: CircleBorder(),
          child: Icon(Icons.add,color: Colors.white,),
        ),
        body: TabBarView(
            children: [buildFirstTabBarView(), buildSecondTabBarView()]),
        bottomNavigationBar: buildBottomNavigationBar(),backgroundColor: Colors.white,
      ),
    );
  }

  //탭바 1번째 화면
  Container buildFirstTabBarView() {
    return Container(
      color: HexColor("#D6D7EF"),
      child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return buildSubItem("Title", "subTitle", context);
          }),
    );
  }


  //탭바 2번째 화면
  Center buildSecondTabBarView() => Center();

  //하단 네비게이션 바
  TabBar buildBottomNavigationBar() {
    return TabBar(
        indicatorColor: Colors.transparent,
        labelColor: HexColor("#9395D3"),
        unselectedLabelColor: HexColor("#8B8787"),
        tabs: [
          Tab(
            icon: Icon(
              Icons.list,
            ),
            text: 'Main',
          ),
          Tab(
            icon: Icon(
              Icons.check_outlined,
            ),
            text: 'Completed',
          ),
        ]);
  }


  //목록 아이템
  Padding buildSubItem(String title, String subtitle, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 8, right: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.withOpacity(0.2),
          //     blurRadius: 8.0 ,
          //     spreadRadius: 4.0,
          //     offset: Offset(0,10),
          //   )
          // ]
        ),
        // color: Colors.white,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: HexColor("#B3B7EE"),
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(subtitle),
                  )
                ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () => {context.push(AppRoutes.editTask)},
                    icon: Icon(Icons.create_outlined),
                    color: HexColor("#B3B7EE"),
                  ),
                  IconButton(
                      onPressed: () => {},
                      icon: Icon(Icons.delete_outline),
                      color: HexColor("#B3B7EE")),
                  IconButton(
                    onPressed: () => {},
                    icon: Icon(Icons.check_circle_outline),
                    color: HexColor("#B3B7EE"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

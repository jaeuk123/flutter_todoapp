import 'package:demo_todo_app/Utils/HexColor.dart';
import 'package:flutter/material.dart';

/**
 * 기본 Appbar actionsButton 이나 leadingButton 중 한개를 받아 이벤트 처리 가능
 */
class BuildSingleEventIconAppBar extends AppBar {
  final String titleText;
  final IconData? actionsButton;
  final IconData? leadingButton;
  final VoidCallback? onPressedEvent;

  BuildSingleEventIconAppBar({
    required this.titleText,
    this.onPressedEvent,
    this.actionsButton,
    this.leadingButton,
    Key? key,
  }) : super(
            key: key,
            title: Text(
              titleText,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            flexibleSpace: Padding(padding: const EdgeInsets.only(top: 20,bottom: 20)),
            backgroundColor: HexColor("#9395D3"),
            actions: actionsButton != null
                ? [
                    IconButton(
                      onPressed: () {
                        onPressedEvent;
                      },
                      icon: Icon(
                        actionsButton,
                        color: Colors.white,
                      ),
                    )
                  ]
                : null,
            leading: leadingButton != null
                ? IconButton(
                    onPressed: onPressedEvent,
                    icon: Icon(
                      leadingButton,
                      color: Colors.white,
                    ))
                : null);
}

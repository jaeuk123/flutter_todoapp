import 'package:demo_todo_app/Utils/HexColor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 배경 보라 + 텍스트 컬러 흰색 Radius 10적용된 디폴트 버튼
 * textString - 내용 (requirea)
 * onPressedEvent - 클릭 이벤트
 * textBold - fontWeight.Bold
 */
class RoundedTextButton extends StatelessWidget {
  final String textString;
  final bool? textBold;
  final VoidCallback? onPressedEvent;

  RoundedTextButton(this.textString,
      {this.textBold, super.key, this.onPressedEvent});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressedEvent != null
            ? onPressedEvent!()
            : print("No Click Event RoundedTextButton");
      },
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: HexColor("#9395D3")),
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 15),
            child: Center(
              child: Text(
                textString,
                style: TextStyle(
                    fontWeight:
                        textBold != null ? FontWeight.bold : FontWeight.normal,
                    fontSize: 16,
                    color: Colors.white),
              ),
            ),
          )),
    );
  }
}

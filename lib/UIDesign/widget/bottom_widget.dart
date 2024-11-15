import 'package:flutter/material.dart';

class BottomWidget extends StatefulWidget {
  const BottomWidget({super.key});

  @override
  State<BottomWidget> createState() => _BottomWidgetState();
}

class _BottomWidgetState extends State<BottomWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: Colors.white,
      padding: EdgeInsets.only(left: 30, right: 30),
      child: Row(
        children: [
          Text(
            "In this Lesson we Learn \n 1313P",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
          Spacer(),
          FilledButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
              ),
              child: Text(
                "Start",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}

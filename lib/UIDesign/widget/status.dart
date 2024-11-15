import 'package:flutter/material.dart';

class Status extends StatefulWidget {
  const Status({super.key});
  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                "assets/images/bg2.png",
                scale: 25,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "In this lession We learn \n new words",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          LinearProgressIndicator(
            color: Colors.blue,
            value: 0.7,
          )
        ],
      ),
    );
  }
}

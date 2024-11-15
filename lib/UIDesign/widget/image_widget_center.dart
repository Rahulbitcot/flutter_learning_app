import 'package:flutter/material.dart';

class ImageWidgetCenter extends StatelessWidget {
  const ImageWidgetCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "100 Essential \n Grammer",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.start,
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            CircleAvatar(
              radius: 20, // Avatar radius
              backgroundColor: Colors.transparent,
              child: ClipOval(
                child: Image.asset(
                  "assets/images/bg2.png",
                  fit: BoxFit.cover,
                  width: 40, // Matches CircleAvatar radius
                  height: 40,
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              "In the Lesson we learn \n new Word",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Finished",
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

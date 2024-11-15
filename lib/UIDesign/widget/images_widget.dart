import 'package:flutter/material.dart';
import 'package:flutter_learning_app/UIDesign/widget/bottom.dart';
import 'package:flutter_learning_app/UIDesign/widget/image_widget_center.dart';

class ImagesWidget extends StatelessWidget {
  const ImagesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg.png"), // Fixed usage
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 40,
          left: 0,
          right: 0,
          child: Row(
            children: [
              Icon(Icons.arrow_back),
              SizedBox(width: 10),
              Text(
                "Back",
                style: TextStyle(color: Colors.white),
              ),
              Spacer(),
              Text(
                "CamoVaxl",
                style: TextStyle(
                    color: Colors.yellow, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              CircleAvatar(
                radius: 20, // Avatar radius
                backgroundColor: Colors.transparent,
                child: ClipOval(
                  child: Image.asset(
                    "assets/images/bg.png",
                    fit: BoxFit.cover,
                    width: 40, // Matches CircleAvatar radius
                    height: 40,
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 50,
          left: 10,
          child: ImageWidgetCenter(),
        ),
        SizedBox(
          height: 20,
        ),
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: Bottom(),
        ),
      ],
    );
  }
}

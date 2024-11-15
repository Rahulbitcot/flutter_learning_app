import 'package:flutter/material.dart';
import 'package:flutter_learning_app/UIDesign/widget/bottom_widget.dart';
import 'package:flutter_learning_app/UIDesign/widget/images_widget.dart';
import 'package:flutter_learning_app/UIDesign/widget/list.dart';
import 'package:flutter_learning_app/UIDesign/widget/status.dart';

class Ui extends StatelessWidget {
  const Ui({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: ImagesWidget()),
          Status(),
          Expanded(child: ListClass()),
          BottomWidget(),
        ],
      ),
    );
  }
}

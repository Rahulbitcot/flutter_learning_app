import 'package:flutter/material.dart';
import 'package:flutter_learning_app/UIDesign/widget/list_item.dart';

class ListClass extends StatelessWidget {
  const ListClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Container(
        width: double.infinity,
        child: ListView(
          children: [
            ListItem(
              description:
                  "In the lessons we learn new words and rules  for vacalaburities continues and articles",
            ),
            Spacer(),
            ListItem(
              description:
                  "In the lessons we learn new words and rules  for vacalaburities continues and articles",
            ),
            Spacer(),
            ListItem(
              description:
                  "In the lessons we learn new words and rules  for vacalaburities continues and articles",
            ),
            Spacer(),
            ListItem(
              description:
                  "In the lessons we learn new words and rules  for vacalaburities continues and articles",
            ),
            Spacer(),
            ListItem(
              description:
                  "In the lessons we learn new words and rules  for vacalaburities continues and articles",
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

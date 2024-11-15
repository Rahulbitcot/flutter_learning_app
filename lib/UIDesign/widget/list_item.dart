import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 30,
          ),
          Icon(
            Icons.sports,
            color: Colors.blue,
            size: 50,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Completed",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Introduction",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    description,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.normal),
                    softWrap: true,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

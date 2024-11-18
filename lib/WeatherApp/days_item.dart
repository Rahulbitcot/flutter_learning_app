import 'package:flutter/material.dart';

class DaysItem extends StatelessWidget {
  const DaysItem({super.key, required this.day});
  final String day;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: 8.0), // Add spacing between items
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(129, 2, 93, 178),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        border: Border.all(
          color: const Color.fromARGB(255, 0, 0, 0),
          width: 3,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            day,
            style: TextStyle(color: Colors.white),
            overflow: TextOverflow
                .ellipsis, // Ensures text does not wrap and is truncated if too long
          ),
          SizedBox(
            height: 10,
          ),
          Icon(Icons.cloud, color: Colors.white),
          SizedBox(
            height: 10,
          ),
          Text(
            "19*C",
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

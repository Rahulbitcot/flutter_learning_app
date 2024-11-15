import 'package:flutter/material.dart';

class Bottom extends StatelessWidget {
  const Bottom({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(width: 20),
          Icon(Icons.lock_clock),
          SizedBox(width: 10),
          Text(
            "7 Days",
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(width: 20), // Replace Spacer with SizedBox for fixed spacing
          Container(
            padding: EdgeInsets.symmetric(vertical: 3, horizontal: 8),
            decoration: BoxDecoration(
              color: const Color.fromARGB(124, 100, 0, 52),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              "Reputation",
              style: TextStyle(
                color: const Color.fromARGB(255, 255, 132, 0),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(width: 20),
          Container(
            padding: EdgeInsets.symmetric(vertical: 3, horizontal: 8),
            decoration: BoxDecoration(
              color: const Color(0x330091FF),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              "24 Lesson",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          SizedBox(width: 20),
          Container(
            padding: EdgeInsets.symmetric(vertical: 3, horizontal: 8),
            decoration: BoxDecoration(
              color: const Color.fromARGB(51, 38, 255, 0),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              "Start Learning",
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}

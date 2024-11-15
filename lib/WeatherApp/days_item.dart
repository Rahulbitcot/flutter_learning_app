import 'package:flutter/material.dart';

class DaysItem extends StatelessWidget {
  const DaysItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
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
          children: [
            Text(
              "Mon",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            Icon(Icons.cloud),
            SizedBox(
              height: 10,
            ),
            Text(
              "19",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_learning_app/WeatherApp/days_item.dart';
import 'package:flutter_learning_app/WeatherApp/update_location_screen.dart';

class BottomView extends StatefulWidget {
  const BottomView({super.key, required this.location});
  final String location;

  @override
  State<BottomView> createState() => _BottomViewState();
}

class _BottomViewState extends State<BottomView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromARGB(129, 2, 93, 178),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        border: Border.all(
          color: const Color.fromARGB(255, 0, 0, 0),
          width: 5,
        ),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hourly Forecast",
                style: TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center,
              ),
              Spacer(),
              Text(
                "Weekly Forecast",
                style: TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                DaysItem(day: "Sun"),
                DaysItem(day: "Mon"),
                DaysItem(day: "Tue"),
                DaysItem(day: "Wed"),
                DaysItem(day: "Thu"),
                DaysItem(day: "Fri"),
                DaysItem(day: "Sat"),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () async {
              final newLocation = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UpdateLocationScreen(),
                ),
              );
              if (newLocation != null) {
                // await updateLocation(newLocation);
              }
            },
            child: Icon(
              Icons.add_circle_rounded,
              color: Colors.black,
              size: 50,
            ),
          ),
        ],
      ),
    );
  }
}

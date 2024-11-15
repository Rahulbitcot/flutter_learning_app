import 'package:flutter/material.dart';
import 'package:flutter_learning_app/WeatherApp/bottom_view.dart';

class WeatherMain extends StatefulWidget {
  const WeatherMain({super.key});

  @override
  State<WeatherMain> createState() => _WeatherMainState();
}

class _WeatherMainState extends State<WeatherMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App"),
        backgroundColor: const Color.fromARGB(89, 0, 140, 255),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage("assets/images/weatherBg.png"), // Path to your image
            fit: BoxFit.cover, // Cover the entire container
          ),
        ),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 2),
              ),
              Image.asset(
                "assets/images/clouds.png",
                scale: 5,
              ),
              Text(
                "Indore",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              Text(
                "19 C",
                style: TextStyle(color: Colors.white, fontSize: 50),
              ),
              Text(
                "Mostly Clear",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: 20),
              ),
              Spacer(),
              BottomView()
            ],
          ),
        ),
      ),
    );
  }
}

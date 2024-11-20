import 'package:flutter/material.dart';
import 'package:flutter_learning_app/Places/models/places.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.place});

  final List<Places> place;

  @override
  Widget build(BuildContext context) {
    if (place.isEmpty) {
      return const Center(
        child: Text(
          "NO Data Present",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    }

    return ListView.builder(
      itemCount: place.length,
      itemBuilder: (ctx, index) => ListTile(
        title: Text(place[index].title),
      ),
    );
  }
}

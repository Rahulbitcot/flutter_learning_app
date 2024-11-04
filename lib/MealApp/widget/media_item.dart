import 'package:flutter/material.dart';
import 'package:flutter_learning_app/MealApp/models/meal.dart';
import 'package:flutter_learning_app/MealApp/widget/meal_detail_screen.dart';
import 'package:flutter_learning_app/MealApp/widget/meal_item_trail.dart';
import 'package:transparent_image/transparent_image.dart';

class MediaItem extends StatelessWidget {
  const MediaItem(
      {super.key, required this.meal, required this.onToggleMealFavorite});

  final Meal meal;
  final void Function(Meal meal) onToggleMealFavorite;

  void _onSelectMeal(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MealDetailScreen(
            meal: meal, onToggleMealFavorite: onToggleMealFavorite),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {
          _onSelectMeal(context);
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                color: Colors.black54,
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrail(
                            icon: Icons.schedule,
                            label: "${meal.duration} min"),
                        const SizedBox(
                          width: 16,
                        ),
                        MealItemTrail(
                            icon: Icons.work, label: meal.complexity.name),
                        const SizedBox(
                          width: 16,
                        ),
                        MealItemTrail(
                            icon: Icons.money, label: meal.affordability.name),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:food_menu/components/meal_item.dart';

import '../models/meal.dart';
import 'package:flutter/material.dart';

class FavoritveScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoritveScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text("Minhas comidas favoritas"),
      );
    } else {
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(meal: favoriteMeals[index]);
        },
      );
    }
  }
}

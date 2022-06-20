import 'package:flutter/material.dart';
import 'package:food_menu/screens/meal_detail_scrren.dart';
import 'screens/categories_screen.dart';
import 'screens/categories_meals_screen.dart';
import 'screens/meal_detail_scrren.dart';
import 'screens/tab_screen.dart';
import 'screens/settings_screen.dart';
import 'utils/app_routs.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primaryColor: Colors.pink,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.amber),
        fontFamily: 'Raleway',
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      routes: {
        AppRouts.HOME: (ctx) => TabScreen(),
        AppRouts.CATEGORIES_MEALS: (ctx) => CategoriesMealsScreen(),
        AppRouts.MEAL_DETAIL: (ctx) => MealDetailScreen(),
        AppRouts.SETTINGS: (ctx) => Settings(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) {
          return CategoriesScreen();
        });
      },
    );
  }
}

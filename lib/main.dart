import 'package:flutter/material.dart';
import 'package:food_menu/screens/meal_detail_screen.dart';
import 'screens/categories_meals_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/tab_screen.dart';
import 'screens/settings_screen.dart';
import 'utils/app_routs.dart';
import 'models/meal.dart';

import 'models/settings.dart';
import 'data/dummy_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _availabelMeals = dummyMeals;
  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;
      _availabelMeals = dummyMeals.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

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
        AppRouts.CATEGORIES_MEALS: (ctx) =>
            CategoriesMealsScreen(meals: _availabelMeals),
        AppRouts.MEAL_DETAIL: (ctx) => MealDetailScreen(),
        AppRouts.SETTINGS: (ctx) => SettingsScreen(_filterMeals, settings),
      },
      /*onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) {
          return CategoriesScreen();
        });
      },*/
    );
  }
}

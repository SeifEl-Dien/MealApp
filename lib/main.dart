import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udemy_mealapp/dummy_data.dart';
import 'package:udemy_mealapp/models/meal.dart';
import 'package:udemy_mealapp/screens/categories_screen.dart';
import 'package:udemy_mealapp/screens/category_meal_screen.dart';
import 'package:udemy_mealapp/screens/filters_screen.dart';
import 'package:udemy_mealapp/screens/meal_details_screen.dart';
import 'package:udemy_mealapp/screens/tabs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };
  List<Meal> _availablemeal = DUMMY_MEALS;
  List<Meal> _favouritemeal = [];

  void _setfilters(Map _filterData) {
    setState(() {
      _filters = _filterData;
      _availablemeal = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] == true && meal.isGlutenFree == false)
          return false;
        if (_filters['lactose'] == true && meal.isLactoseFree == false)
          return false;
        if (_filters['vegan'] == true && meal.isVegan == false) return false;
        if (_filters['vegetarian'] == true && meal.isVegetarian == false)
          return false;
        return true;
      }).toList();
    });
  }

  void _toggleFavourite(String mealId) {
    final existingIndex =
        _favouritemeal.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favouritemeal.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favouritemeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _ismealfavourite(String id) {
    return _favouritemeal.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: Colors.amber,
          ),
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 50, 50, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 50, 50, 1),
              ),
              headline1: TextStyle(
                  fontSize: 25,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold))),
      routes: {
        '/': (context) => TabsScreen(_favouritemeal),
        CategoryMealScreen.routeName: (context) =>
            CategoryMealScreen(_availablemeal),
        MealDetailsScreen.routeName: (context) =>
            MealDetailsScreen(_toggleFavourite, _ismealfavourite),
        FiltersScreen.routeNamed: (context) =>
            FiltersScreen(_filters, _setfilters),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Meal App'),
        ),
        body: null);
  }
}

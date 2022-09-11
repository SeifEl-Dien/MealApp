import 'package:flutter/material.dart';
import 'package:udemy_mealapp/dummy_data.dart';
import 'package:udemy_mealapp/models/meal.dart';
import 'package:udemy_mealapp/widgets/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = 'categorymeal';
  final List<Meal> availablemeals;

  const CategoryMealScreen(this.availablemeals);

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String categorytitle;
  List<Meal> displayedmeals;
  @override
  void didChangeDependencies() {
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryid = routeArg['id'];
    categorytitle = routeArg['title'];
    displayedmeals = widget.availablemeals.where((meal) {
      return meal.categories.contains(categoryid);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeItem(String mealId) {
    setState(() {
      displayedmeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categorytitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            title: displayedmeals[index].title,
            imageurl: displayedmeals[index].imageUrl,
            duration: displayedmeals[index].duration,
            affordability: displayedmeals[index].affordability,
            complexity: displayedmeals[index].complexity,
            id: displayedmeals[index].id,
          );
        },
        itemCount: displayedmeals.length,
      ),
    );
  }
}

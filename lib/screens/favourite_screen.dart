import 'package:flutter/material.dart';
import 'package:udemy_mealapp/models/meal.dart';
import 'package:udemy_mealapp/widgets/meal_item.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> favouritemeal;

  FavouriteScreen(this.favouritemeal);
  @override
  Widget build(BuildContext context) {
    if (favouritemeal.isEmpty) {
      return Center(
        child: Text('You have no favourites yet - start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            title: favouritemeal[index].title,
            imageurl: favouritemeal[index].imageUrl,
            duration: favouritemeal[index].duration,
            affordability: favouritemeal[index].affordability,
            complexity: favouritemeal[index].complexity,
            id: favouritemeal[index].id,
          );
        },
        itemCount: favouritemeal.length,
      );
    }
  }
}

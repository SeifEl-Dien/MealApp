import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:udemy_mealapp/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).colorScheme.secondary,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          listilemeth(Icons.restaurant, 'Meal', () {
            Navigator.pushReplacementNamed(context, '/');
          }),
          listilemeth(Icons.settings, 'Filters', () {
            Navigator.pushReplacementNamed(context, FiltersScreen.routeNamed);
          }),
        ],
      ),
    );
  }

  ListTile listilemeth(IconData icon, String title, Function tap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontSize: 24,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold),
      ),
      onTap: tap,
    );
  }
}

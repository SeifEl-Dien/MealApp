import 'package:flutter/material.dart';
import 'package:udemy_mealapp/models/meal.dart';
import 'package:udemy_mealapp/screens/categories_screen.dart';
import 'package:udemy_mealapp/screens/favourite_screen.dart';
import 'package:udemy_mealapp/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouritemeal;

  TabsScreen(this.favouritemeal);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List _pages;

  int _selectedpageindex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': Categoriesscreen(),
        'title': 'Categories',
      },
      {
        'page': FavouriteScreen(widget.favouritemeal),
        'title': 'Favourites',
      },
    ];
    // TODO: implement initState
    super.initState();
  }

  void _selectPage(int value) {
    setState(() {
      _selectedpageindex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedpageindex]['title']),
      ),
      body: _pages[_selectedpageindex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          unselectedItemColor: Colors.white,
          currentIndex: _selectedpageindex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favourites',
            ),
          ]),
      drawer: MainDrawer(),
    );
  }
}

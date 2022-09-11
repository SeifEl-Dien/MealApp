import 'package:flutter/material.dart';
import 'package:udemy_mealapp/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeNamed = '/filters';
  final Function savefilters;

  final Map currentfilters;

  const FiltersScreen(this.currentfilters, this.savefilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  @override
  void initState() {
    _glutenFree = widget.currentfilters['gluten'];
    _lactoseFree = widget.currentfilters['lactose'];
    _vegan = widget.currentfilters['vegan'];
    _vegetarian = widget.currentfilters['vegetarian'];
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your filters'),
        actions: [
          IconButton(
              onPressed: () {
                final selectedfilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.savefilters(selectedfilters);
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.headline1,
              )),
          Expanded(
              child: ListView(
            children: [
              switchlist(context, 'Gluten free',
                  'Only include gluten free meals', _glutenFree, (newvalue) {
                setState(() {
                  _glutenFree = newvalue;
                });
              }),
              switchlist(context, 'Lactose free',
                  'Only include lactose free meals', _lactoseFree, (newvalue) {
                setState(() {
                  _lactoseFree = newvalue;
                });
              }),
              switchlist(
                  context, 'Vegan Meals', 'Only include Vegan meals', _vegan,
                  (newvalue) {
                setState(() {
                  _vegan = newvalue;
                });
              }),
              switchlist(context, 'Vegetarian Meals',
                  'Only include Vegetarian meals', _vegetarian, (newvalue) {
                setState(() {
                  _vegetarian = newvalue;
                });
              }),
            ],
          ))
        ],
      ),
      drawer: MainDrawer(),
    );
  }

  SwitchListTile switchlist(BuildContext context, String title, String subtitle,
      bool value, Function fim) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        activeColor: Theme.of(context).colorScheme.secondary,
        value: value,
        onChanged: fim);
  }
}

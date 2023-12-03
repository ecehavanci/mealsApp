import 'package:flutter/material.dart';
import 'package:meals_app/dummy_Data/dumm_meals.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/filters.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/main_drawer.dart';

const kInitialFilters = {
  Filter.gluten_free: false,
  Filter.lactose_free: false,
  Filter.vegatarian: false,
  Filter.vegan: false
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedIndex = 0;
  final List<Meal> _favMeals = [];
  Map<Filter, bool> selectedFilters = kInitialFilters;

  void _selectPage(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _toggleMealFavStatus(Meal meal) {
    bool isExist = _favMeals.contains(meal);
    if (isExist) {
      setState(() {
        _favMeals.remove(meal);
      });
      _showInfoMessage("Meal deleted from favourites.");
    } else {
      setState(() {
        _favMeals.add(meal);
      });
      _showInfoMessage("Meal marked as favourite.");
    }
  }

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  void _setScreen(String identifier) async {
    if (identifier == 'Filters') {
      Navigator.pop(context); //close the drawer maindrawer

      final result =
          await Navigator.of(context).push<Map<Filter, bool>>(MaterialPageRoute(
              builder: (ctx) => FiltersScreen(
                    currentFilters: selectedFilters,
                  )));

      // print(result);
      setState(() {
        selectedFilters = result ?? kInitialFilters;
      });
    } else {
      Navigator.pop(context); //close the drawer maindrawer
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = dummyMeals.where((meal) {
      if (selectedFilters[Filter.gluten_free]! && !meal.isGlutenFree) {
        return false;
      }
      if (selectedFilters[Filter.lactose_free]! && !meal.isLactoseFree) {
        return false;
      }
      if (selectedFilters[Filter.vegatarian]! && !meal.isVegetarian) {
        return false;
      }
      if (selectedFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

    Widget activePage = CategoriesScreen(
      onToggleFav: _toggleMealFavStatus,
      availableMeals: availableMeals,
    );
    String activePageTitle = "Categories";

    if (_selectedIndex == 1) {
      activePage =
          MealsScreen(meals: _favMeals, onToggleFav: _toggleMealFavStatus);
      activePageTitle = "Your Favorites";
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(activePageTitle),
        ),
        drawer: MainDrawer(onSelectedScreen: _setScreen),
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.set_meal), label: "Categories"),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorites"),
          ],
          currentIndex: _selectedIndex,
        ),
        body: activePage);
  }
}

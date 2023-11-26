import 'package:flutter/material.dart';
import 'package:meals_app/dummy_Data/dumm_categories.dart';
import 'package:meals_app/dummy_Data/dumm_meals.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void navigateCategory(BuildContext context, Category selectedCategory) {
    final filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(selectedCategory.id))
        .toList();

    Navigator.of(context).push(MaterialPageRoute(
        builder: ((context) =>
            MealsScreen(title: selectedCategory.title, meals: filteredMeals))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Pick your category."),
        ),
        body: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          children: [
            for (final category in availableCategories)
              CategoryGridItem(
                  category: category,
                  onSelectCategory: () {
                    navigateCategory(context, category);
                  })
          ],
        ));
  }
}

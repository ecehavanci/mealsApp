import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/dummy_Data/dumm_meals.dart';

final mealsProvider = Provider((ref) {
  return dummyMeals;
});

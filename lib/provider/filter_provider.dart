import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter { gluten_free, lactose_free, vegatarian, vegan }

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.gluten_free: false,
          Filter.lactose_free: false,
          Filter.vegatarian: false,
          Filter.vegan: false
        });

  void setFilter(Filter filter, bool isActive) {
    state = {...state, filter: isActive};
  }

  void setAllFilters(Map<Filter, bool> allFilters) {
    state = allFilters;
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>((ref) {
  return FiltersNotifier();
});

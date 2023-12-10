import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/provider/filter_provider.dart';
import 'package:meals_app/screens/tabs.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  void _setGlutenValue(bool changedValue, WidgetRef ref) {
    ref
        .read(filtersProvider.notifier)
        .setFilter(Filter.gluten_free, changedValue);
  }

  void _setLactoseValue(bool changedValue, WidgetRef ref) {
    ref
        .read(filtersProvider.notifier)
        .setFilter(Filter.lactose_free, changedValue);
  }

  void _setVegetarianValue(bool changedValue, WidgetRef ref) {
    ref
        .read(filtersProvider.notifier)
        .setFilter(Filter.vegatarian, changedValue);
  }

  void _setVeganValue(bool changedValue, WidgetRef ref) {
    ref.read(filtersProvider.notifier).setFilter(Filter.vegan, changedValue);
  }

  // void _setScreen(String identifier) {
  //   if (identifier == 'Meals') {
  //     Navigator.pop(context); //close the drawer maindrawer

  //     Navigator.of(context).pushReplacement(
  //         MaterialPageRoute(builder: (ctx) => const TabsScreen()));
  //   } else {
  //     Navigator.pop(context); //close the drawer maindrawer
  //   }
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
      ),
      // drawer: MainDrawer(onSelectedScreen: _setScreen),
      body: Column(
        children: [
          SwitchListTile(
            value: activeFilters[Filter.gluten_free]!,
            onChanged: (bool val) {
              _setGlutenValue(val, ref);
            },
            title: Text(
              "Gluten-free",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              "Only include gluten-free meals.",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 24, right: 30),
          ),
          SwitchListTile(
            value: activeFilters[Filter.lactose_free]!,
            onChanged: (bool val) {
              _setLactoseValue(val, ref);
            },
            title: Text(
              "Lactose-free",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              "Only include lactose-free meals.",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 24, right: 30),
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegatarian]!,
            onChanged: (bool val) {
              _setVegetarianValue(val, ref);
            },
            title: Text(
              "Vegetarian",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              "Only include vegetarian meals.",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 24, right: 30),
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegan]!,
            onChanged: (bool val) {
              _setVeganValue(val, ref);
            },
            title: Text(
              "Vegan",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              "Only include vegan meals.",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 24, right: 30),
          )
        ],
      ),
    );
  }
}

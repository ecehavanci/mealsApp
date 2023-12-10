import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/provider/filter_provider.dart';
import 'package:meals_app/screens/tabs.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({super.key});

  @override
  ConsumerState<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  bool _glutenFreeFilterSet = false;
  bool _lactoseFreeFilterSet = false;
  bool _vegetarianFilterSet = false;
  bool _veganFilterSet = false;

  @override
  void initState() {
    final activeFilters = ref.read(filtersProvider);

    _glutenFreeFilterSet = activeFilters[Filter.gluten_free]!;
    _lactoseFreeFilterSet = activeFilters[Filter.lactose_free]!;
    _vegetarianFilterSet = activeFilters[Filter.vegatarian]!;
    _veganFilterSet = activeFilters[Filter.vegan]!;

    super.initState();
  }

  void _setGlutenValue(bool changedValue) {
    setState(() {
      _glutenFreeFilterSet = changedValue;
    });
  }

  void _setLactoseValue(bool changedValue) {
    setState(() {
      _lactoseFreeFilterSet = changedValue;
    });
  }

  void _setVegetarianValue(bool changedValue) {
    setState(() {
      _vegetarianFilterSet = changedValue;
    });
  }

  void _setVeganValue(bool changedValue) {
    setState(() {
      _veganFilterSet = changedValue;
    });
  }

  void _setScreen(String identifier) {
    if (identifier == 'Meals') {
      Navigator.pop(context); //close the drawer maindrawer

      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => const TabsScreen()));
    } else {
      Navigator.pop(context); //close the drawer maindrawer
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      //WillPopScope widget helps us to override what happens when a user presses the back button on the device or pops the current route.
      onWillPop: () async {
        ref.read(filtersProvider.notifier).setAllFilters({
          Filter.gluten_free: _glutenFreeFilterSet,
          Filter.lactose_free: _lactoseFreeFilterSet,
          Filter.vegatarian: _vegetarianFilterSet,
          Filter.vegan: _veganFilterSet
        });
        // Navigator.of(context).pop(); //returns data when leaving the screen
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Filters"),
        ),
        // drawer: MainDrawer(onSelectedScreen: _setScreen),
        body: Column(
          children: [
            SwitchListTile(
              value: _glutenFreeFilterSet,
              onChanged: _setGlutenValue,
              title: Text(
                "Gluten-free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                "Only include gluten-free meals.",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 24, right: 30),
            ),
            SwitchListTile(
              value: _lactoseFreeFilterSet,
              onChanged: _setLactoseValue,
              title: Text(
                "Lactose-free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                "Only include lactose-free meals.",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 24, right: 30),
            ),
            SwitchListTile(
              value: _vegetarianFilterSet,
              onChanged: _setVegetarianValue,
              title: Text(
                "Vegetarian",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                "Only include vegetarian meals.",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 24, right: 30),
            ),
            SwitchListTile(
              value: _veganFilterSet,
              onChanged: _setVeganValue,
              title: Text(
                "Vegan",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                "Only include vegan meals.",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 24, right: 30),
            )
          ],
        ),
      ),
    );
  }
}

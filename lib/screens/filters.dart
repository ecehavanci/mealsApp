import 'package:flutter/material.dart';
import 'package:meals_app/screens/tabs.dart';

enum Filter { gluten_free, lactose_free, vegatarian, vegan }

class FiltersScreen extends StatefulWidget {
  final Map<Filter, bool> currentFilters;
  const FiltersScreen({super.key, required this.currentFilters});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFreeFilterSet = false;
  bool _lactoseFreeFilterSet = false;
  bool _vegetarianFilterSet = false;
  bool _veganFilterSet = false;

  @override
  void initState() {
    _glutenFreeFilterSet = widget.currentFilters[Filter.gluten_free]!;
    _lactoseFreeFilterSet = widget.currentFilters[Filter.lactose_free]!;
    _vegetarianFilterSet = widget.currentFilters[Filter.vegatarian]!;
    _veganFilterSet = widget.currentFilters[Filter.vegan]!;

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
        Navigator.of(context).pop({
          Filter.gluten_free: _glutenFreeFilterSet,
          Filter.lactose_free: _lactoseFreeFilterSet,
          Filter.vegatarian: _vegetarianFilterSet,
          Filter.vegan: _veganFilterSet
        }); //returns data when leaving the screen
        return false;
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

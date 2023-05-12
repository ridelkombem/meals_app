import 'package:flutter/material.dart';
import '../widgets/build_filter_screen_list_switch_tile.dart';

//map keys set to be used to get filtervalues when filterscreen is popped 
enum Filter {
  gluttenFree,
  lactoseFree,
  vegan,
  vegetarian,
}


class FilterScreen extends StatefulWidget {
  const FilterScreen({
    Key? key,
    required this.currentFilters,
  }) : super(key: key);
  final Map<Filter, bool> currentFilters;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _gluttenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _veganFilterSet = false;
  var _vegetarianFilterSet = false;

  @override
  void initState() {
    super.initState();
    _gluttenFreeFilterSet = widget.currentFilters[Filter.gluttenFree]!;
    _lactoseFreeFilterSet = widget.currentFilters[Filter.lactoseFree]!;
    _veganFilterSet = widget.currentFilters[Filter.vegan]!;
    _vegetarianFilterSet = widget.currentFilters[Filter.vegetarian]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      //   drawer:  MainDrawer(onSelectScreen: (String identifier) {
      //     Navigator.of(context).pop();
      // if (identifier == 'meals') {
      //  Navigator.of(context).pushNamed(TabsScreen.routename);
      // }
//drawer no longer needed since we need back button to change filterstate using willpopscope
      //    },),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
//these changes the filter values on left to true/false based on changed switch from right map values
            Filter.gluttenFree: _gluttenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegan: _veganFilterSet,
            Filter.vegetarian: _vegetarianFilterSet,
            
          });
          return false;
          //return true will pop twice since we already have leave screen logic of pop screen above
        },
        child: Column(
          children: [
            Expanded(
                child: ListView(
              children: [
                BuildSwitchTile(
                  title: 'Gluten-free',
                  subtitle: 'Only include gluten-free meals.',
                  currentValue: _gluttenFreeFilterSet,
                  updateValue: (isChecked) {
                    setState(() {
                      _gluttenFreeFilterSet = isChecked;
                    });
                  },
                ),
                BuildSwitchTile(
                  title: 'Lactose-free',
                  subtitle: 'Only include lactose-free meals.',
                  currentValue: _lactoseFreeFilterSet,
                  updateValue: (isChecked) {
                    setState(() {
                      _lactoseFreeFilterSet = isChecked;
                    });
                  },
                ),
                BuildSwitchTile(
                  title: 'Vegan',
                  subtitle: 'Only include vegan meals.',
                  currentValue: _veganFilterSet,
                  updateValue: (isChecked) {
                    setState(() {
                      _veganFilterSet = isChecked;
                    });
                  },
                ),
                BuildSwitchTile(
                  title: 'Vegetarian',
                  subtitle: 'Only include Vegetarian meals.',
                  currentValue: _vegetarianFilterSet,
                  updateValue: (isChecked) {
                    setState(() {
                      _vegetarianFilterSet = isChecked;
                    });
                  },
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}


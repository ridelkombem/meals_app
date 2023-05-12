import 'package:flutter/material.dart';
import '../models/meals.dart';
import '../screens/filters_screen.dart';
import '../screens/meals_overview_screen.dart';
import '../models/meal.dart';
import '../widgets/main_drawer.dart';
import '../screens/categories_overview_screen.dart';

const kInitialFilters = {
  Filter.gluttenFree: false,
  Filter.lactoseFree: false,
  Filter.vegan: false,
  Filter.vegetarian: false,
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
//handling favorite meals which is a meals screen of choosen favorite meals

  final List<Meal> _favoriteMeals = [];

  void _showInfoMessageFavorite(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void toggleMealFavoritestatus(Meal meal) {
    final isExisting = _favoriteMeals.contains(meal);
    if (isExisting) {
      setState(() {
        _favoriteMeals.remove(meal);
        _showInfoMessageFavorite('Meal is no longer a Favorite');
      });
    } else {
      setState(() {
        _favoriteMeals.add(meal);
        _showInfoMessageFavorite('Marked as a Favorite!');
      });
    }
  }

  // handling the filterscreen(filters) and tabscreen(meals)
  Map<Filter, bool> _selectedFilters = kInitialFilters;

  void _setScreenFromDrawer(String identifier) async {
    Navigator.of(context).pop();
    //because you remain on the tabs screen when meals on the side drawer is pressed
    if (identifier == 'filters') {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
          MaterialPageRoute(
              builder: (ctx) =>
                  FilterScreen(currentFilters: _selectedFilters)));
      // print(result);
      //get result from filters
      setState(() {
        _selectedFilters = result ?? kInitialFilters;
      });
    }
  }

// handling the tabscreen
  int _selectedPageIndex = 0;

  void selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    final meals = Meals();
    List<Meal> availableMeals = meals.items.where((meal) {
      //setting up a new meal list called availablemeals based on set filters
      //from print(result) we see latest values for_selectedFilters[Filter.gluttenFree]
      //meal.isVegan is a bool and we use!meal.isVegan to get opposite value
      //if meal.isVegan=true,and thefore I return false by excluding meals that are not vegan(!meal.isVegan)
      if (_selectedFilters[Filter.gluttenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      if (_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();

//setting the tabscreen
    Widget activePage = CategoriesOverviewScreen(
      onToggleFavorite: toggleMealFavoritestatus,
      availableMeals: availableMeals,
    );

    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      activePage = MealsOverviewScreen(
          meals: _favoriteMeals, onToggleFavorite: toggleMealFavoritestatus);
      activePageTitle = 'Your Favorites';
      //there is no favorite screen, same meals screen with filtered meals
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      drawer: MainDrawer(
        onSelectScreen: _setScreenFromDrawer,
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: selectPage,
          currentIndex: _selectedPageIndex,
          unselectedItemColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.category,
                ),
                label: 'Categories'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.star,
                ),
                label: 'Favorites')
          ]),
    );
  }
}

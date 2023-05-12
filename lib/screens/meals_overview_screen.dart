import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../screens/meal_detail_screen.dart';
import '../widgets/meal_item.dart';

class MealsOverviewScreen extends StatelessWidget {
  static const routename = 'MealsScreen';
  const MealsOverviewScreen({
    Key? key,
    this.title,
    required this.meals,
    required this.onToggleFavorite,
  }) : super(key: key);
  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFavorite;

  void selectMeal(BuildContext context, Meal meal) {
   
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            MealDetailScreen(meal: meal, onToggleFavorite: onToggleFavorite),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Column(children: [
      Expanded(
          child: ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, i) => MealItem(
          meal: meals[i],
          onselectMeal: ( meal) {
            selectMeal(context, meal);
          },
        ),
      )),
    ]);

    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Uh oh....nothing here!',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Try selecting a different category!',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            )
          ],
        ),
      );
    }

    if (title == null) {
      return content;
    }
    //If there is no title we stop code here and thus only display the content

    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: content);
  }
}

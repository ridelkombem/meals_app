import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../models/meals.dart';
import '../widgets/build_meal_detail_container.dart';
import '../widgets/build_meal_detail_title.dart';

class MealDetailScreen extends StatelessWidget {
  static const routename = 'MealsDetailScreen';
  const MealDetailScreen({
    Key? key,
    required this.meal,
    required this.onToggleFavorite,
  }) : super(key: key);

  final Meal meal;
  final void Function(Meal mealp) onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    final meals = Meals();

    final id = meal.id;

    final mealD = meals.items.firstWhere((ml) => (ml.id == id));

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                onToggleFavorite(mealD);
              },
              icon: const Icon(Icons.star))
        ],
        title: Text(mealD.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                mealD.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const BuildMealDetailTitle(
              title: 'Ingredients',
            ),
            const SizedBox(
              height: 14,
            ),
            BuildMealDetailContainer(
              child: ListView.builder(
                itemCount: mealD.ingredients.length,
                itemBuilder: (context, i) => Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                  child: Text(
                    mealD.ingredients[i],
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            const BuildMealDetailTitle(
              title: 'Steps',
            ),
            const SizedBox(
              height: 14,
            ),
            BuildMealDetailContainer(
              child: ListView.builder(
                itemCount: mealD.steps.length,
                itemBuilder: (context, i) => Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      child: Text(
                        mealD.steps[i],
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




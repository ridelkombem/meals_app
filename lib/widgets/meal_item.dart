import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import '../models/meal.dart';
import '../widgets/meal_item_widget.dart';


class MealItem extends StatelessWidget {
  const MealItem({
    Key? key,
    required this.meal,
    required this.onselectMeal,
  }) : super(key: key);
  final Meal meal;
  final void Function(Meal meal) onselectMeal;

  @override
  Widget build(BuildContext context) {
    // final meals = Meals();
    //for the delete option)

    //incase we are passing back a delete function from a page
    // onTap:
    //
    // () {
    //   Navigator.pushNamed(context, MealDetailScreen.routename,
    //       arguments: {'id': meal.id}).then((result) {
    //     if (result != null) {
    //       meals.deleteItem(result.toString());
    //     }
    //   });
    // },

    return InkWell(
      onTap: () {
        onselectMeal(meal);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        margin: const EdgeInsets.all(8),
        clipBehavior: Clip.hardEdge,
        elevation: 2,
        child: Column(
          children: [
            Stack(
              children: [
                FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(
                    meal.imageUrl,
                  ),
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity,
                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      width: 300,
                      color: Colors.black54,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 20),
                          child: Column(
                            children: [
                              Text(
                                meal.title,
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          )),
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                MealItemWidget(
                  icon: (Icons.schedule),
                  label: '${meal.duration} min',
                ),
                const SizedBox(
                  width: 12,
                ),
                MealItemWidget(
                  icon: (Icons.work),
                  label:
                      meal.complexity.name[0].toUpperCase() + meal.complexity.name.substring(1),
                ),
                const SizedBox(
                  width: 12,
                ),
                MealItemWidget(
                  icon: (Icons.attach_money),
                  label:
                      meal.affordability.name[0].toUpperCase() + meal.affordability.name.substring(1),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}


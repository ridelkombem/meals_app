import 'package:flutter/material.dart';
import '../models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  final Function() onselectCategory;
  const CategoryItem({
    Key? key,
    required this.category,
    required this.onselectCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onselectCategory,
      // onTap: () {
      //   Navigator.pushNamed(context, MealsOverviewScreen.routename,
      //       arguments: id);
      // },
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
              colors: [category.color.withOpacity(0.55), category.color.withOpacity(0.9)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        child: Padding(
         padding: const EdgeInsets.all(8.0),
          child: Text(
            category.title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground 
          ),)
        ),
      ),
    );
  }
}

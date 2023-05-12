import 'package:flutter/material.dart';

class BuildListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onTap;
  const BuildListTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(
          icon,
          size: 26,color: Theme.of(context).colorScheme.onBackground,
        ),
        title: Text(title,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(color:Theme.of(context).colorScheme.onBackground,
            fontSize: 24)),
        onTap: () {
          onTap();
        });
  }
}
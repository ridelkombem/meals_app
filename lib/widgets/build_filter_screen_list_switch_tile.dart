import 'package:flutter/material.dart';

class BuildSwitchTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool currentValue;
  final Function(bool) updateValue;
  const BuildSwitchTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.currentValue,
    required this.updateValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
        activeColor: Theme.of(context).colorScheme.tertiary,
        title: Text(title,  
        style: Theme.of(context).textTheme.titleLarge!.copyWith(color:Theme.of(context).colorScheme.onBackground,)),
        subtitle: Text(subtitle,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(color:Theme.of(context).colorScheme.onBackground)),
        value: currentValue,
        onChanged: updateValue);
  }
}

import 'package:flutter/material.dart';

class BuildMealDetailContainer extends StatelessWidget {
  final Widget child;
  const BuildMealDetailContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 150, width: 310, child: child);
  }
}
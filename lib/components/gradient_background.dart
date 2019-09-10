import 'package:flutter/material.dart';
import '../themes/colors.dart';

class GradientBackground extends StatelessWidget {
  final Color firstColor;
  final Color secondColor;

  GradientBackground({
    this.firstColor =  orangeColor,
    this.secondColor = purpleColor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                firstColor,
                secondColor
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomRight
          )
      ),
    );
  }
}

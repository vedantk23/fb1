import 'package:flutter/material.dart';

class SliderWidget extends StatelessWidget {
   const SliderWidget({
    super.key,
    required this.tip, required this.onChanged,
  });

  final double tip;
  final ValueChanged<double> onChanged;


  @override
  Widget build(BuildContext context) {
    return Slider(value:tip,
    min: 0.0,max: 0.5, onChanged: onChanged,
   label:"${(tip*100).round()}%");
  }
}
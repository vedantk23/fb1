import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  const RowWidget({
    super.key,
    required this.theme,
    required this.counter,
    required this.onIncrement,
    required this.onDecrement,
  });

  final ThemeData theme;
  final double counter;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: const Text("Split"),
        ),
        Row(
          children: [
            IconButton(
              color: theme.colorScheme.primary,
              onPressed: onDecrement, icon: Icon(Icons.remove)),
            Text("$counter",
            style: theme.textTheme.titleMedium
            ),
            IconButton(
              color: theme.colorScheme.primary,
              onPressed: onIncrement, icon: Icon(Icons.add)),
          ],
        )
    
      ],
    );
  }
}
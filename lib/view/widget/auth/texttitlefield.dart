import 'package:flutter/material.dart';

class TextTitleField extends StatelessWidget {
  final String text ;
  const TextTitleField({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
              text,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayLarge,
            );
  }
}
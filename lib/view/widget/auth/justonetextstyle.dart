import 'package:flutter/material.dart';

class MyCustomTextStyle extends StatelessWidget {
  final String mytext ;
  
  
  const MyCustomTextStyle({super.key, required this.mytext,  });

  @override
  Widget build(BuildContext context) {
    return Text(
      mytext, style: Theme.of(context).textTheme.displayLarge,
    );
  }
}
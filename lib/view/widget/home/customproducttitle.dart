import 'package:flutter/material.dart';

class CustomProductTitle extends StatelessWidget {
  final String productTitle ;
  const CustomProductTitle({super.key, required this.productTitle});

  @override
  Widget build(BuildContext context) {
    return Text(
      productTitle,
      textAlign: TextAlign.center,
      style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 20 , color: Colors.grey[800]),
    );
  }
}

import 'package:flutter/material.dart';

class ProductSale extends StatelessWidget {
  final String descount;
  final String text;

  const ProductSale({super.key, required this.descount, required this.text});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 46,
      child: Container(
        width: 60,
        height: 30,
        decoration: BoxDecoration(color: Colors.red.shade900),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              descount,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}

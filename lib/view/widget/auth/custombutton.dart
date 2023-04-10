import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomButtonAuth extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomButtonAuth({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      // ignore: prefer_const_constructors
      margin: EdgeInsets.only(top: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              backgroundColor: AppColor.customBlack,
              textStyle: Theme.of(context).textTheme.displayMedium,
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 8)),
        onPressed: onPressed,
        child: Text(
          text, 
        ),
      ),
    );
  }
}

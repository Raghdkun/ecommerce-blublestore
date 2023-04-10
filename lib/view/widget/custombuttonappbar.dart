import 'package:flutter/material.dart';

class CustomButtonAppbar extends StatelessWidget {
  final void Function()? onPressed;
  final String textButton;
  final IconData icon;

   final bool active  ;
  const CustomButtonAppbar({
    super.key,
    required this.onPressed,
    required this.textButton,
    required this.icon,
    required this.active
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: active == true ? Colors.blue : Colors.black,
          ),
          Text(
            textButton,
            style:
                TextStyle(color: active == true ? Colors.blue : Colors.black),
          )
        ],
      ),
    );
  }
}

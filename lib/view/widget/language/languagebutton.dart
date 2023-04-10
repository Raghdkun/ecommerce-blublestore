import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class LanguageButton extends StatelessWidget {
  final String textbutton ; 
  final void Function()? onPressed ;
  const LanguageButton({super.key, required this.textbutton, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
              width: double.infinity,
              
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            backgroundColor: AppColor.pink,
            textStyle: Theme.of(context).textTheme.displayLarge,
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 8)),
                onPressed: onPressed,
                child:  Text(textbutton),
              ),
            );
  }
}
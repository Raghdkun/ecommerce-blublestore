import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomButtonCart extends StatelessWidget {
  final String textbutton ; 
  final void Function()? onPressed ;
  const CustomButtonCart({super.key, required this.textbutton, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
              width: 260,
              
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            backgroundColor: AppColor.customBlack,
            
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 8)),
                onPressed: onPressed,
                child:  Text(textbutton, style: TextStyle(fontWeight: FontWeight.bold),),
              ),
            );
  }
}
import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomButtonCoupon extends StatelessWidget {
  final String textbutton;
  final void Function()? onPressed;
  const CustomButtonCoupon(
      {super.key, required this.textbutton, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,

      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            // shape: const StadiumBorder(),
            backgroundColor: AppColor.customBlack,
           ),
        onPressed: onPressed,
        child: Text(textbutton, style: TextStyle(fontSize: 12),),
      ),
    );
  }
}

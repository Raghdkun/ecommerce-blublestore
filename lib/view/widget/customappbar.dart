import 'package:flutter/material.dart';

class CustomAppBarTop extends StatelessWidget {
  final String myText;
  final void Function()? onPressed;
  final IconData? backicon;
  final void Function()? onpressedback;
  final void Function()? favpressed;


  const CustomAppBarTop(
      {super.key,
      required this.myText,
      this.onPressed,
      this.backicon,
      this.onpressedback, this.favpressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: IconButton(onPressed: onpressedback, icon: Icon(backicon, size: 25,)),
        ),
        Padding(
          padding: const EdgeInsets.only(),
          child: Text(
            myText,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
          ),
        ),
        const Spacer(),
       
      ],
    );
  }
}

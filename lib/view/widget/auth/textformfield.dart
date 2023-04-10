import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final String labeltext;
  final IconData iconData;
  final TextEditingController? myController;
  final String? Function(String?) vaild;
  final bool isNumber;
  final bool? obscureText ;
  final void Function()? onTapIcon ;

  const CustomTextFormField(
      {super.key,
      this.onTapIcon,
      this.obscureText,
      required this.hintText,
      required this.labeltext,
      required this.iconData,
      required this.myController,
      required this.vaild,
      required this.isNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        keyboardType: isNumber
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        validator: vaild,
        controller: myController,
        obscureText: obscureText == null || obscureText == false  ? false : true ,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(fontSize: 14),
            suffixIcon: InkWell(onTap: onTapIcon,child: Icon(iconData),),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 7),
                child: Text(
                  labeltext,
                  textAlign: TextAlign.center,
                )),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 22),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
      ),
    );
  }
}

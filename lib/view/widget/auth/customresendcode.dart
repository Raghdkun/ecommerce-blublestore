// import 'dart:async';
// import 'package:flutter/material.dart';

// enum ButtonType { materialButton, textButton, outlinedButton }

// const int aSec = 1;

// const String _secPostFix = 's';
// const String labelSplitter = " | ";

// class CustomTimerButton extends StatefulWidget {
//   final String label;
//   final String secPostFix;
//   final int timeOutInSeconds;
//   final VoidCallback onPressed;
//   final Color color;
//   final Color disabledColor;
//   final TextStyle? activeTextStyle;
//   final TextStyle disabledTextStyle;
//   final ButtonType buttonType;
//   final bool resetTimerOnPressed;

//   const CustomTimerButton({
//     Key? key,
//     required this.label,
//     required this.onPressed,
//     required this.timeOutInSeconds,
//     this.secPostFix = _secPostFix,
//     this.color = Colors.blue,
//     this.resetTimerOnPressed = true,
//     this.disabledColor = Colors.grey,
//     this.buttonType = ButtonType.materialButton,
//     this.activeTextStyle,
//     this.disabledTextStyle = const TextStyle(color: Colors.black45),
//   }) : super(key: key);

//   @override
//   _TimerButtonState createState() => _TimerButtonState();
// }

// class _TimerButtonState extends State<CustomTimerButton> {
//   bool timeUpFlag = false;
//   int timeCounter = 0;

//   String get _timerText => '$timeCounter${widget.secPostFix}';

//   @override
//   void initState() {
//     super.initState();
//     timeCounter = widget.timeOutInSeconds;
//     _timerUpdate();
//   }

//   _timerUpdate() {
//     Timer(const Duration(seconds: aSec), () async {
//       setState(() {
//         timeCounter--;
//       });
//       if (timeCounter != 0) {
//         _timerUpdate();
//       } else {
//         timeUpFlag = true;
//       }
//     });
//   }

//   Widget _buildChild() {
//     TextStyle? activeTextStyle;
//     if (widget.activeTextStyle == null) {
//       if (widget.buttonType == ButtonType.outlinedButton) {
//         activeTextStyle = TextStyle(color: widget.color);
//       } else {
//         activeTextStyle = const TextStyle(color: Colors.white);
//       }
//     } else {
//       activeTextStyle = widget.activeTextStyle;
//     }
//     return Container(
//       child: timeUpFlag
//           ? Text(
//               widget.label,
//               style: activeTextStyle,
//             )
//           : Text(
//               widget.label + labelSplitter + _timerText,
//               style: widget.disabledTextStyle,
//             ),
//     );
//   }

//   _onPressed() {
//     if (timeUpFlag) {
//       setState(() {
//         timeUpFlag = false;
//       });
//       timeCounter = widget.timeOutInSeconds;

//       widget.onPressed();

// // reset the timer when the button is pressed
//       if (widget.resetTimerOnPressed) {
//         _timerUpdate();
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     switch (widget.buttonType) {
//       case ButtonType.materialButton:
//         return Container(
//           // padding: const EdgeInsets.symmetric(horizontal: 10),
//           margin: const EdgeInsets.only(top: 10),
//           child: MaterialButton(
//             padding: const EdgeInsets.symmetric(vertical: 5),
//             onPressed: _onPressed,
//             color: timeUpFlag ? widget.color : widget.disabledColor,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10.0),
//             ),
//             child: _buildChild(),
//           ),
//         );
//       case ButtonType.textButton:
//         return TextButton(
//             onPressed: _onPressed,
//             style: TextButton.styleFrom(
//               backgroundColor: timeUpFlag ? widget.color : widget.disabledColor,
//             ),
//             child: _buildChild());
//       case ButtonType.outlinedButton:
//         return OutlinedButton(
//             onPressed: _onPressed,
//             style: OutlinedButton.styleFrom(
//               side: BorderSide(
//                 color: timeUpFlag ? widget.color : widget.disabledColor,
//               ),
//             ),
//             child: _buildChild());
//       default:
//         return Container();
//     }
//   }
// }

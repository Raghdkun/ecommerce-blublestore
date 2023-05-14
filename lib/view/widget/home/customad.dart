import 'package:flutter/material.dart';

class CustomAd extends StatelessWidget {
  final String title ;
  final String body ;

  const CustomAd({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Stack(children: [
        Container(
          alignment: Alignment.center,
          height: 150,
          decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(20)),
          child:  ListTile(
            title: Text(title,
                style: const TextStyle(color: Colors.white, fontSize: 20)),
            subtitle: Text(body,
                style: const TextStyle(color: Colors.white, fontSize: 30)),
          ),
        ),
        // Positioned(
        //   top: -20,
        //   right: -20,
        //   child: Container(
        //     height: 160,
        //     width: 160,
        //     decoration: BoxDecoration(
        //         color: AppColor.black,
        //         borderRadius: BorderRadius.circular(160)),
        //   ),
        // )
      ]),
    );
  }
}

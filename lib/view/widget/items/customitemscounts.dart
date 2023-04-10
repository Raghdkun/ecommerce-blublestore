import 'package:flutter/material.dart';

class CustomItemsCount extends StatelessWidget {
  final void Function()? onPressedAdd ;
  final void Function()? onPressedRemove ;
  final String count ; 

  const CustomItemsCount({super.key, this.onPressedAdd , this.onPressedRemove , required this.count});

  @override
  Widget build(BuildContext context) {
    return Positioned(
          left: 10,
          // bottom: 50,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: onPressedAdd, icon: Icon(Icons.add, color: Colors.white,)),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.white)),
                child: Text(
                  count,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white,),
                ),
              ),
              IconButton(onPressed: onPressedRemove, icon: Icon(Icons.remove, color: Colors.white,)),
            ],
          ),
        );
  }
}
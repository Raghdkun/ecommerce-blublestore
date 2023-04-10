import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:powerecommerce/linkapi.dart';

class CartList extends StatelessWidget {
  final String name;
  final String price;
  final String count;
  final String imagename;

  final void Function()? onPressedAdd;
  final void Function()? onPressedRemove;

  const CartList(
      {super.key,
      required this.name,
      required this.price,
      required this.count,
      this.onPressedAdd,
      this.onPressedRemove,
      required this.imagename});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: CachedNetworkImage(
                  imageUrl: "${AppLink.imageitems}/$imagename",
                  
                )),
            Expanded(
                flex: 4,
                child: ListTile(
                  title: Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(price),
                )),
            Expanded(
                child: Column(
              children: [
                Container(
                    height: 30,
                    child: IconButton(
                        onPressed: onPressedAdd, icon: Icon(Icons.add))),
                Container(
                  height: 30,
                  child: Text(count, style: TextStyle(fontSize: 17)),
                ),
                Container(
                  height: 30,
                  child: IconButton(
                      onPressed: onPressedRemove, icon: Icon(Icons.remove)),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}

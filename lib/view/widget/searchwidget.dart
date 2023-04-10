import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:powerecommerce/linkapi.dart';

class SearchWidget extends StatelessWidget {
  final String name;
  final String price;

  final String imagename;

  const SearchWidget(
      {super.key,
      required this.name,
      required this.price,
      required this.imagename});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          child: Row(
            children: [
              Expanded(
                  flex: 2,
                  child: CachedNetworkImage(
                    imageUrl: "${AppLink.imageitems}/$imagename",
                    
                    fit: BoxFit.cover,
                  )),
              Expanded(
                  flex: 5,
                  child: ListTile(
                    title: Text(
                      name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(price),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

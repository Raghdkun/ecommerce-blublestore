import 'package:flutter/material.dart';

class OrdersList extends StatelessWidget {
  final String ordersNumber;
  final String orderStatus;
  final String ordersTotalprice;
  final void Function()? onTap;
  const OrdersList(
      {super.key,
      required this.ordersNumber,
      required this.orderStatus,
      required this.ordersTotalprice,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Card(
          color: Colors.grey[50],
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  trailing: const Icon(
                    Icons.numbers_outlined,
                  ),
                  title: Text(ordersNumber),
                ),
                Divider(),
                ListTile(
                  trailing: const Icon(
                    Icons.arrow_circle_left,
                  ),
                  title: Text(orderStatus),
                ),
                Divider(),
                ListTile(
                  trailing: const Icon(
                    Icons.price_check,
                  ),
                  title: Text(ordersTotalprice),
                ),
                Divider(),
                ListTile(
                  trailing: const Icon(
                    Icons.arrow_drop_down_circle,
                  ),
                  title: Text("More Details"),
                  onTap: onTap,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 15,
        )
      ],
    );
  }
}

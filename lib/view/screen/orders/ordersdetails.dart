import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:powerecommerce/controller/orders/ordersdetailscontroller.dart';
import 'package:powerecommerce/core/class/handlingdataview.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    OrdersDetailsController controller = Get.put(OrdersDetailsController());
    return Scaffold(
        appBar: AppBar(
          title: Text("Orders Details"),
        ),
        body: GetBuilder<OrdersDetailsController>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Container(
                  margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: ListView(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 0),
                      child: Card(
                        color: Colors.grey.shade300,
                        child: Table(
                          children: [
                            TableRow(children: [
                              Text(
                                "Product Name",
                                // style: TextStyle(fontSize: 15,),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 13,
                                ),
                              ),
                              Text(
                                "Product Count",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 13,
                                ),
                              ),
                              Text(
                                "Disscount",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 13,
                                ),
                              ),
                              Text(
                                "Product Price",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 13,
                                ),
                              ),
                            ]),
                            ...List.generate(
                              controller.data.length,
                              (index) => TableRow(children: [
                                Text(
                                  "${controller.data[index].itemsName}",
                                  // style: TextStyle(fontSize: 15,),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                                Text(
                                  "${controller.data[index].countitems}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                                Text(
                                  "${controller.data[index].itemsDescount}%",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                                Text(
                                  "${controller.data[index].itemsPrice}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                              ]),
                            )
                          ],
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // Divider(color: Colors.black45),

                    controller.ordersModel.ordersCoupon! > 0
                        ? Card(
                            color: Colors.grey.shade300,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Coupon Activated"),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.check_circle,
                                  size: 18,
                                  color: Colors.green,
                                ),
                                // Text("${controller.ordersModel.ordersCoupon}%"),
                              ],
                            ),
                          )
                        : Container(),
                    Card(
                      child: Table(
                        children: [
                          TableRow(children: [
                            Text(
                              "Product Name",
                              // style: TextStyle(fontSize: 15,),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              "Product Color",
                              // style: TextStyle(fontSize: 15,),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              "Product Size",
                              // style: TextStyle(fontSize: 15,),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ]),
                          ...List.generate(
                            controller.data.length,
                            (index) => TableRow(children: [
                              Text(
                                "${controller.data[index].itemsName}",
                                // style: TextStyle(fontSize: 15,),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 13,
                                ),
                              ),
                              Text(
                                "${controller.data[index].cartOrderscolor}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 13,
                                ),
                              ),
                              Text(
                                "${controller.data[index].cartOrderssize}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 13,
                                ),
                              ),
                            ]),
                          )
                        ],
                      ),
                    ),
                    Card(
                      color: Colors.grey.shade300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Total"),
                          Container(),
                          Text(
                              "${controller.ordersModel.ordersTotalprice} S.P"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.check_circle,
                          size: 18,
                          color: Colors.green,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Choosen Address",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    Card(
                      color: Colors.grey.shade300,
                      child: Column(
                        children: [
                          ListTile(
                              title: Text(
                                  "City : ${controller.ordersModel.addressCity} ")),
                          ListTile(
                              title: Text(
                                  "Shipping : ${controller.ordersModel.addressShipping} ")),
                        ],
                      ),
                    )
                  ]))),
        ));
  }
}

class OrderDetailsList extends StatelessWidget {
  const OrderDetailsList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

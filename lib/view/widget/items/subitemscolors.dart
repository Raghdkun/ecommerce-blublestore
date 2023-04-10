// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:powerecommerce/controller/items_controller.dart';
// import 'package:powerecommerce/controller/productdetals_controller.dart';

// class SubItemColors extends GetView<ProductDetailsControlllerImp> {
//   const SubItemColors({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SliverAppBar(
//       toolbarHeight: 0,
//       backgroundColor: Colors.white,
//       actions: [
//          if (controller.itemsModel.itemsColor1 != "" )   SliverToBoxAdapter(
//                   child: Container(
//                     child: Text(
//                       "Colors",
//                       // style: TextStyle(color: Colors.white, fontSize: 20),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//              if (controller.itemsModel.itemsColor1 != "" )    SliverToBoxAdapter(
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 15),
//                     child:  Container(
//                         width: Get.width / 3,
//                         child: SingleChildScrollView(
//                           scrollDirection: Axis.horizontal,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               controller.itemsModel.itemsColor1 != ""
//                                   ? Container(
//                                       margin: const EdgeInsets.only(right: 5),
//                                       height: 60,
//                                       width: 90,
//                                       alignment: Alignment.center,
//                                       decoration: BoxDecoration(
//                                           border:
//                                               Border.all(color: Colors.white),
//                                           borderRadius:
//                                               BorderRadius.circular(25),
//                                           color: Colors.purple[800]),
//                                       child: Text(
//                                         "${controller.itemsModel.itemsColor1}",
//                                         style: const TextStyle(
//                                             color: Colors.white,
//                                             fontWeight: FontWeight.bold,
//                                             fontSize: 18),
//                                       ),
//                                     )
//                                   : Container(),
//                               controller.itemsModel.itemsColor2 != ""
//                                   ? Container(
//                                       margin: const EdgeInsets.only(right: 5),
//                                       height: 60,
//                                       width: 90,
//                                       alignment: Alignment.center,
//                                       decoration: BoxDecoration(
//                                           border:
//                                               Border.all(color: Colors.white),
//                                           borderRadius:
//                                               BorderRadius.circular(25),
//                                           color: Colors.purple[800]),
//                                       child: Text(
//                                         "${controller.itemsModel.itemsColor2}",
//                                         style: const TextStyle(
//                                             color: Colors.white,
//                                             fontWeight: FontWeight.bold,
//                                             fontSize: 18),
//                                       ),
//                                     )
//                                   : Container(),
//                               controller.itemsModel.itemsColor3 != ""
//                                   ? Container(
//                                       margin: const EdgeInsets.only(right: 5),
//                                       height: 60,
//                                       width: 90,
//                                       alignment: Alignment.center,
//                                       decoration: BoxDecoration(
//                                           border:
//                                               Border.all(color: Colors.white),
//                                           borderRadius:
//                                               BorderRadius.circular(25),
//                                           color: Colors.purple[800]),
//                                       child: Text(
//                                         "${controller.itemsModel.itemsColor3}",
//                                         style: const TextStyle(
//                                             color: Colors.white,
//                                             fontWeight: FontWeight.bold,
//                                             fontSize: 18),
//                                       ),
//                                     )
//                                   : Container(),
//                               controller.itemsModel.itemsColor4 != ""
//                                   ? Container(
//                                       margin: const EdgeInsets.only(right: 5),
//                                       height: 60,
//                                       width: 90,
//                                       alignment: Alignment.center,
//                                       decoration: BoxDecoration(
//                                           border:
//                                               Border.all(color: Colors.white),
//                                           borderRadius:
//                                               BorderRadius.circular(25),
//                                           color: Colors.purple[800]),
//                                       child: Text(
//                                         "${controller.itemsModel.itemsColor4}",
//                                         style: const TextStyle(
//                                             color: Colors.white,
//                                             fontWeight: FontWeight.bold,
//                                             fontSize: 18),
//                                       ),
//                                     )
//                                   : Container(),
//                               // controller.itemsModel.itemsColor5 != "null"
//                               //     ? Container(
//                               //         margin: const EdgeInsets.only(right: 5),
//                               //         height: 60,
//                               //         width: 90,
//                               //         alignment: Alignment.center,
//                               //         decoration: BoxDecoration(
//                               //             border:
//                               //                 Border.all(color: Colors.white),
//                               //             borderRadius:
//                               //                 BorderRadius.circular(25),
//                               //             color: Colors.purple[800]),
//                               //         child: Text(
//                               //           "${controller.itemsModel.itemsColor5}",
//                               //           style: const TextStyle(
//                               //               color: Colors.white,
//                               //               fontWeight: FontWeight.bold,
//                               //               fontSize: 18),
//                               //         ),
//                               //       )
//                               //     : Container(),
//                               // controller.itemsModel.itemsColor6 == null
//                               //     ? Container(
//                               //         margin: const EdgeInsets.only(right: 5),
//                               //         height: 60,
//                               //         width: 90,
//                               //         alignment: Alignment.center,
//                               //         decoration: BoxDecoration(
//                               //             border:
//                               //                 Border.all(color: Colors.white),
//                               //             borderRadius:
//                               //                 BorderRadius.circular(25),
//                               //             color: Colors.purple[800]),
//                               //         child: Text(
//                               //           "${controller.itemsModel.itemsColor6}",
//                               //           style: const TextStyle(
//                               //               color: Colors.white,
//                               //               fontWeight: FontWeight.bold,
//                               //               fontSize: 18),
//                               //         ),
//                               //       )
//                               //     : Container(),
//                             ],
//                           ),
//                         )),
//                   ),
//                 ),
//       ],
//     );
//   }
// }
// Hero(
//                       tag: "${controller.itemsModel.itemsId!}",
//                       child: CachedNetworkImage(
//                         imageUrl:
//                             "${AppLink.imageitems}/${controller.itemsModel.itemsImage!}",

//                         // width: 320,
//                         fit: BoxFit.fill,
//                         alignment: Alignment.center,
//                       ),
//                     ),


//                     Text(
//                       "${translateDataBase(controller.itemsModel.itemsNameAr, controller.itemsModel.itemsName)}",
//                       style: Theme.of(context).textTheme.displayLarge,
//                       textAlign: TextAlign.center,
//                     ),


//                     Stack(
//                         clipBehavior: Clip.none,
//                         alignment: Alignment.topCenter,
//                         children: [
//                           Positioned(
//                               top: 10,
//                               right: 15,
//                               child: Icon(
//                                 Icons.store_mall_directory_outlined,
//                                 size: 40,
//                                 color: Colors.white,
//                               )),
//                           Container(
//                             margin: EdgeInsets.symmetric(
//                                 horizontal: 10, vertical: 10),
//                             child: Center(
//                               child: Text(
//                                 "${translateDataBase(controller.itemsModel.itemsDescAr, controller.itemsModel.itemsDesc)}",
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w300,
//                                     fontSize: 16),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                         ],
//                       ),

//                       Container(
//                     child: Text(
//                       "Colors",
//                       // style: TextStyle(color: Colors.white, fontSize: 20),
//                       textAlign: TextAlign.center,
//                     ),



//                     Row(
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


//                           Text(
//                       "Available Sizes",
//                       // style: TextStyle(color: Colors.white, fontSize: 20),
//                       textAlign: TextAlign.center,
//                     ),

//                     Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             controller.itemsModel.itemsSize1 != ""
//                                 ? Container(
//                                     margin: const EdgeInsets.only(right: 5),
//                                     height: 60,
//                                     width: 90,
//                                     alignment: Alignment.center,
//                                     decoration: BoxDecoration(
//                                         border: Border.all(color: Colors.white),
//                                         borderRadius: BorderRadius.circular(25),
//                                         color: Colors.purple[800]),
//                                     child: Text(
//                                       "${controller.itemsModel.itemsSize1}",
//                                       style: const TextStyle(
//                                           color: Colors.white,
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 18),
//                                     ),
//                                   )
//                                 : Container(),
//                             controller.itemsModel.itemsSize2 != ""
//                                 ? Container(
//                                     margin: const EdgeInsets.only(right: 5),
//                                     height: 60,
//                                     width: 90,
//                                     alignment: Alignment.center,
//                                     decoration: BoxDecoration(
//                                         border: Border.all(color: Colors.white),
//                                         borderRadius: BorderRadius.circular(25),
//                                         color: Colors.purple[800]),
//                                     child: Text(
//                                       "${controller.itemsModel.itemsSize2}",
//                                       style: const TextStyle(
//                                           color: Colors.white,
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 18),
//                                     ),
//                                   )
//                                 : Container(),
//                             controller.itemsModel.itemsSize3 != ""
//                                 ? Container(
//                                     margin: const EdgeInsets.only(right: 5),
//                                     height: 60,
//                                     width: 90,
//                                     alignment: Alignment.center,
//                                     decoration: BoxDecoration(
//                                         border: Border.all(color: Colors.white),
//                                         borderRadius: BorderRadius.circular(25),
//                                         color: Colors.purple[800]),
//                                     child: Text(
//                                       "${controller.itemsModel.itemsSize3}",
//                                       style: const TextStyle(
//                                           color: Colors.white,
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 18),
//                                     ),
//                                   )
//                                 : Container(),
//                             // controller.itemsModel.itemsSize4 != null
//                             //     ? Container(
//                             //         margin: const EdgeInsets.only(right: 5),
//                             //         height: 60,
//                             //         width: 90,
//                             //         alignment: Alignment.center,
//                             //         decoration: BoxDecoration(
//                             //             border:
//                             //                 Border.all(color: Colors.white),
//                             //             borderRadius:
//                             //                 BorderRadius.circular(25),
//                             //             color: Colors.purple[800]),
//                             //         child: Text(
//                             //           "${controller.itemsModel.itemsSize4}",
//                             //           style: const TextStyle(
//                             //               color: Colors.white,
//                             //               fontWeight: FontWeight.bold,
//                             //               fontSize: 18),
//                             //         ),
//                             //       )
//                             //     : Container(),
//                             // controller.itemsModel.itemsColor5 != "null"
//                             //     ? Container(
//                             //         margin: const EdgeInsets.only(right: 5),
//                             //         height: 60,
//                             //         width: 90,
//                             //         alignment: Alignment.center,
//                             //         decoration: BoxDecoration(
//                             //             border:
//                             //                 Border.all(color: Colors.white),
//                             //             borderRadius:
//                             //                 BorderRadius.circular(25),
//                             //             color: Colors.purple[800]),
//                             //         child: Text(
//                             //           "${controller.itemsModel.itemsColor5}",
//                             //           style: const TextStyle(
//                             //               color: Colors.white,
//                             //               fontWeight: FontWeight.bold,
//                             //               fontSize: 18),
//                             //         ),
//                             //       )
//                             //     : Container(),
//                             // controller.itemsModel.itemsColor6 == null
//                             //     ? Container(
//                             //         margin: const EdgeInsets.only(right: 5),
//                             //         height: 60,
//                             //         width: 90,
//                             //         alignment: Alignment.center,
//                             //         decoration: BoxDecoration(
//                             //             border:
//                             //                 Border.all(color: Colors.white),
//                             //             borderRadius:
//                             //                 BorderRadius.circular(25),
//                             //             color: Colors.purple[800]),
//                             //         child: Text(
//                             //           "${controller.itemsModel.itemsColor6}",
//                             //           style: const TextStyle(
//                             //               color: Colors.white,
//                             //               fontWeight: FontWeight.bold,
//                             //               fontSize: 18),
//                             //         ),
//                             //       )
//                             //     : Container(),
//                           ],
//                         )

//                         ItemsPriceAndCart()
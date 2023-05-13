import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:powerecommerce/controller/home_controller.dart';
import 'package:powerecommerce/core/functions/translatedatabase.dart';
import 'package:powerecommerce/data/model/categoriesmodel.dart';
import 'package:powerecommerce/linkapi.dart';

class CustomCategories extends GetView<HomeControllerImp> {
  const CustomCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      // decoration: BoxDecoration(borderRadius:BorderRadius.circular(10) , color: AppColor.black ),
      height: 100,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Categories(
            i : index ,
            categoriesModel:
                Categoriesmodel.fromJson(controller.categories[index]),
          );
        },
      ),
    );
  }
}

class Categories extends GetView<HomeControllerImp> {
  final int? i ;
  final Categoriesmodel categoriesModel;
  const Categories( {
    super.key,
    required this.categoriesModel,
    required this.i,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItems(controller.categories ,i! , categoriesModel.catId.toString());
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: 100,
            height: 50,
            child: SvgPicture.network(
                "${AppLink.imagecategories}/${categoriesModel.catImage}"),
          ),
          Text("${translateDataBase(categoriesModel.catNamear, categoriesModel.catName)}"),
        ],
      ),
    );
  }
}

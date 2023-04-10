import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:powerecommerce/controller/items_controller.dart';
import 'package:powerecommerce/core/constant/color.dart';
import 'package:powerecommerce/core/functions/translatedatabase.dart';
import 'package:powerecommerce/data/model/categoriesmodel.dart';

class CustomCategoriesItems extends GetView<ItemsControllerImp> {
  const CustomCategoriesItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      // decoration: BoxDecoration(borderRadius:BorderRadius.circular(10) , color: AppColor.black ),
      height: 50,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Categories(
            i: index,
            categoriesModel:
                Categoriesmodel.fromJson(controller.categories[index]),
          );
        },
      ),
    );
  }
}

class Categories extends GetView<ItemsControllerImp> {
  final int? i;
  final Categoriesmodel categoriesModel;
  const Categories({
    super.key,
    required this.categoriesModel,
    required this.i,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          // controller.goToItems(controller.categories ,i!);
          controller.changeCat(i!, categoriesModel.categoriesId.toString());
        },
        child: GetBuilder<ItemsControllerImp>(
          builder: (controller) => Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 40,
                decoration: controller.selectedCat == i
                    ? const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 5),
                        ),
                      )
                    : null,
                child: Text(
                  "${translateDataBase(categoriesModel.categoriesNameAr, categoriesModel.categoriesNeme)}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: AppColor.customBlack, fontSize: 18),
                ),
              )
            ],
          ),
        ));
  }
}

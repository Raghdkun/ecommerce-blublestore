class ItemsModel {
  int? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImage;
  String? itemsImage2;
  String? itemsImage3;
  int? itemsCount;
  int? itemsStatus;
  int? itemsPrice;
  int? itemsHascolor;
  int? itemsHassize;
  int? itemsDescount;
  String? itemsDate;
  int? itemsCat;
  int? categoriesId;
  String? categoriesNeme;
  String? categoriesNameAr;
  String? categoriesImage;
  String? categoriesDescription;
  String? categoriesDatetime;
  int? itemspricedisscount;

  ItemsModel(
      {this.itemsId,
      this.itemsName,
      this.itemsNameAr,
      this.itemsDesc,
      this.itemsDescAr,
      this.itemsImage,
      this.itemsImage2,
      this.itemsImage3,
      this.itemsCount,
      this.itemsStatus,
      this.itemsPrice,
      this.itemsHascolor,
      this.itemsHassize,
      this.itemsDescount,
      this.itemsDate,
      this.itemsCat,
      this.categoriesId,
      this.categoriesNeme,
      this.categoriesNameAr,
      this.categoriesImage,
      this.categoriesDescription,
      this.categoriesDatetime,
      this.itemspricedisscount});

  ItemsModel.fromJson(Map<String, dynamic> json) {
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsImage = json['items_image'];
    itemsImage2 = json['items_image2'];
    itemsImage3 = json['items_image3'];
    itemsCount = json['items_count'];
    itemsStatus = json['items_status'];
    itemsPrice = json['items_price'];
    itemsHascolor = json['items_hascolor'];
    itemsHassize = json['items_hassize'];
    itemsDescount = json['items_descount'];
    itemsDate = json['items_date'];
    itemsCat = json['items_cat'];
    categoriesId = json['categories_id'];
    categoriesNeme = json['categories_neme'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesImage = json['categories_image'];
    categoriesDescription = json['categories_description'];
    categoriesDatetime = json['categories_datetime'];
    itemspricedisscount = json['itemspricedisscount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_name_ar'] = this.itemsNameAr;
    data['items_desc'] = this.itemsDesc;
    data['items_desc_ar'] = this.itemsDescAr;
    data['items_image'] = this.itemsImage;
    data['items_image2'] = this.itemsImage2;
    data['items_image3'] = this.itemsImage3;
    data['items_count'] = this.itemsCount;
    data['items_status'] = this.itemsStatus;
    data['items_price'] = this.itemsPrice;
    data['items_hascolor'] = this.itemsHascolor;
    data['items_hassize'] = this.itemsHassize;
    data['items_descount'] = this.itemsDescount;
    data['items_date'] = this.itemsDate;
    data['items_cat'] = this.itemsCat;
    data['categories_id'] = this.categoriesId;
    data['categories_neme'] = this.categoriesNeme;
    data['categories_name_ar'] = this.categoriesNameAr;
    data['categories_image'] = this.categoriesImage;
    data['categories_description'] = this.categoriesDescription;
    data['categories_datetime'] = this.categoriesDatetime;
    data['itemspricedisscount'] = this.itemspricedisscount;
    return data;
  }
}

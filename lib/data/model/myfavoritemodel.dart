class MyFavoriteModel {
  int? favoriteId;
  int? favoriteUsersid;
  int? favoriteItemsid;
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
  int? itemsDescount;
  String? itemsDate;
  int? itemsCat;
  int? usersId;
  int? itemspricedisscount;

  MyFavoriteModel(
      {this.favoriteId,
      this.favoriteUsersid,
      this.favoriteItemsid,
      this.itemsId,
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
      this.itemsDescount,
      this.itemsDate,
      this.itemsCat,
      this.usersId,
      this.itemspricedisscount});

  MyFavoriteModel.fromJson(Map<String, dynamic> json) {
    favoriteId = json['favorite_id'];
    favoriteUsersid = json['favorite_usersid'];
    favoriteItemsid = json['favorite_itemsid'];
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
    itemsDescount = json['items_descount'];
    itemsDate = json['items_date'];
    itemsCat = json['items_cat'];
    usersId = json['users_id'];
    itemspricedisscount = json['itemspricedisscount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['favorite_id'] = this.favoriteId;
    data['favorite_usersid'] = this.favoriteUsersid;
    data['favorite_itemsid'] = this.favoriteItemsid;
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
    data['items_descount'] = this.itemsDescount;
    data['items_date'] = this.itemsDate;
    data['items_cat'] = this.itemsCat;
    data['users_id'] = this.usersId;
    data['itemspricedisscount'] = this.itemspricedisscount;
    return data;
  }
}

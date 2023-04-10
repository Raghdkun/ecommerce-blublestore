class CartModel {
  int? itemsprice;
  int? countitems;
  int? cartId;
  int? cartUsersid;
  int? cartItemsid;
  int? cartOrders;
  String? cartOrderscolor;
  String? cartOrderssize;
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

  CartModel(
      {this.itemsprice,
      this.countitems,
      this.cartId,
      this.cartUsersid,
      this.cartItemsid,
      this.cartOrders,
      this.cartOrderscolor,
      this.cartOrderssize,
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
      this.itemsHascolor,
      this.itemsHassize,
      this.itemsDescount,
      this.itemsDate,
      this.itemsCat});

  CartModel.fromJson(Map<String, dynamic> json) {
    itemsprice = json['itemsprice'];
    countitems = json['countitems'];
    cartId = json['cart_id'];
    cartUsersid = json['cart_usersid'];
    cartItemsid = json['cart_itemsid'];
    cartOrders = json['cart_orders'];
    cartOrderscolor = json['cart_orderscolor'];
    cartOrderssize = json['cart_orderssize'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemsprice'] = this.itemsprice;
    data['countitems'] = this.countitems;
    data['cart_id'] = this.cartId;
    data['cart_usersid'] = this.cartUsersid;
    data['cart_itemsid'] = this.cartItemsid;
    data['cart_orders'] = this.cartOrders;
    data['cart_orderscolor'] = this.cartOrderscolor;
    data['cart_orderssize'] = this.cartOrderssize;
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
    return data;
  }
}

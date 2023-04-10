class OrdersModel {
  int? ordersId;
  int? ordersUserid;
  int? ordersAddress;
  String? ordersDateime;
  String? ordersImage;
  String? ordersDeliveryImg;
  int? ordersCoupon;
  int? ordersPrice;
  String? ordersTotalprice;
  int? ordersSavedprice;
  String? ordersColor;
  String? ordersSize;
  int? ordersStatus;
  int? ordersApprove;
  int? ordersRating;
  String? ordersComment;
  int? addressId;
  String? addressName;
  int? addressUsersid;
  String? addressCity;
  String? addressShipping;
  int? addressDelete;

  OrdersModel(
      {this.ordersId,
      this.ordersUserid,
      this.ordersAddress,
      this.ordersDateime,
      this.ordersImage,
      this.ordersDeliveryImg,
      this.ordersCoupon,
      this.ordersPrice,
      this.ordersTotalprice,
      this.ordersSavedprice,
      this.ordersColor,
      this.ordersSize,
      this.ordersStatus,
      this.ordersApprove,
      this.ordersRating,
      this.ordersComment,
      this.addressId,
      this.addressName,
      this.addressUsersid,
      this.addressCity,
      this.addressShipping,
      this.addressDelete});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUserid = json['orders_userid'];
    ordersAddress = json['orders_address'];
    ordersDateime = json['orders_dateime'];
    ordersImage = json['orders_image'];
    ordersDeliveryImg = json['orders_delivery_img'];
    ordersCoupon = json['orders_coupon'];
    ordersPrice = json['orders_price'];
    ordersTotalprice = json['orders_totalprice'];
    ordersSavedprice = json['orders_savedprice'];
    ordersColor = json['orders_color'];
    ordersSize = json['orders_size'];
    ordersStatus = json['orders_status'];
    ordersApprove = json['orders_approve'];
    ordersRating = json['orders_rating'];
    ordersComment = json['Orders_comment'];
    addressId = json['address_id'];
    addressName = json['address_name'];
    addressUsersid = json['address_usersid'];
    addressCity = json['address_city'];
    addressShipping = json['address_shipping'];
    addressDelete = json['address_delete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orders_id'] = this.ordersId;
    data['orders_userid'] = this.ordersUserid;
    data['orders_address'] = this.ordersAddress;
    data['orders_dateime'] = this.ordersDateime;
    data['orders_image'] = this.ordersImage;
    data['orders_delivery_img'] = this.ordersDeliveryImg;
    data['orders_coupon'] = this.ordersCoupon;
    data['orders_price'] = this.ordersPrice;
    data['orders_totalprice'] = this.ordersTotalprice;
    data['orders_savedprice'] = this.ordersSavedprice;
    data['orders_color'] = this.ordersColor;
    data['orders_size'] = this.ordersSize;
    data['orders_status'] = this.ordersStatus;
    data['orders_approve'] = this.ordersApprove;
    data['orders_rating'] = this.ordersRating;
    data['Orders_comment'] = this.ordersComment;
    data['address_id'] = this.addressId;
    data['address_name'] = this.addressName;
    data['address_usersid'] = this.addressUsersid;
    data['address_city'] = this.addressCity;
    data['address_shipping'] = this.addressShipping;
    data['address_delete'] = this.addressDelete;
    return data;
  }
}

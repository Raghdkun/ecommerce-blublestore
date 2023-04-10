class AddressModel {
  int? addressId;
  String? addressName;
  int? addressUsersid;
  String? addressCity;
  String? addressShipping;
  int? addressDelete;

  AddressModel(
      {this.addressId,
      this.addressName,
      this.addressUsersid,
      this.addressCity,
      this.addressShipping,
      this.addressDelete});

  AddressModel.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    addressName = json['address_name'];
    addressUsersid = json['address_usersid'];
    addressCity = json['address_city'];
    addressShipping = json['address_shipping'];
    addressDelete = json['address_delete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_id'] = this.addressId;
    data['address_name'] = this.addressName;
    data['address_usersid'] = this.addressUsersid;
    data['address_city'] = this.addressCity;
    data['address_shipping'] = this.addressShipping;
    data['address_delete'] = this.addressDelete;
    return data;
  }
}

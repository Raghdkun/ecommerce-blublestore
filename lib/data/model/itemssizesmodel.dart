class SizesItemsModel {
  String? itemssizesTitle;
  int? itemsvariationsQuantity;
  int? itemsvariationsItemsid;

  SizesItemsModel(
      {this.itemssizesTitle,
      this.itemsvariationsQuantity,
      this.itemsvariationsItemsid});

  SizesItemsModel.fromJson(Map<String, dynamic> json) {
    itemssizesTitle = json['itemssizes_title'];
    itemsvariationsQuantity = json['itemsvariations_quantity'];
    itemsvariationsItemsid = json['itemsvariations_itemsid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemssizes_title'] = this.itemssizesTitle;
    data['itemsvariations_quantity'] = this.itemsvariationsQuantity;
    data['itemsvariations_itemsid'] = this.itemsvariationsItemsid;
    return data;
  }
}

class ColorsItemsModel {
  String? itemscolorsName;
  int? itemsvariationsItemsid;

  ColorsItemsModel({this.itemscolorsName, this.itemsvariationsItemsid});

  ColorsItemsModel.fromJson(Map<String, dynamic> json) {
    itemscolorsName = json['itemscolors_name'];
    itemsvariationsItemsid = json['itemsvariations_itemsid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemscolors_name'] = this.itemscolorsName;
    data['itemsvariations_itemsid'] = this.itemsvariationsItemsid;
    return data;
  }
}

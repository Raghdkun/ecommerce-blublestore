class Categoriesmodel {
  int? catId;
  String? catName;
  String? catNamear;
  String? catImage;
  String? catTime;

  Categoriesmodel(
      {this.catId, this.catName, this.catNamear, this.catImage, this.catTime});

  Categoriesmodel.fromJson(Map<String, dynamic> json) {
    catId = json['cat_id'];
    catName = json['cat_name'];
    catNamear = json['cat_namear'];
    catImage = json['cat_image'];
    catTime = json['cat_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cat_id'] = this.catId;
    data['cat_name'] = this.catName;
    data['cat_namear'] = this.catNamear;
    data['cat_image'] = this.catImage;
    data['cat_time'] = this.catTime;
    return data;
  }
}

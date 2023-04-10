class Categoriesmodel {
  int? categoriesId;
  String? categoriesNeme;
  String? categoriesNameAr;
  String? categoriesImage;
  String? categoriesDescription;
  String? categoriesDatetime;

  Categoriesmodel(
      {this.categoriesId,
      this.categoriesNeme,
      this.categoriesNameAr,
      this.categoriesImage,
      this.categoriesDescription,
      this.categoriesDatetime});

  Categoriesmodel.fromJson(Map<String, dynamic> json) {
    categoriesId = json['categories_id'];
    categoriesNeme = json['categories_neme'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesImage = json['categories_image'];
    categoriesDescription = json['categories_description'];
    categoriesDatetime = json['categories_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categories_id'] = categoriesId;
    data['categories_neme'] = categoriesNeme;
    data['categories_name_ar'] = categoriesNameAr;
    data['categories_image'] = categoriesImage;
    data['categories_description'] = categoriesDescription;
    data['categories_datetime'] = categoriesDatetime;
    return data;
  }
}
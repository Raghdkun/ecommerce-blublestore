class ContactUsModel {
  int? contactusId;
  String? contactusTitle;
  String? contactusTitleAr;
  String? contactusBody;
  String? contactusBodyAr;
  String? contactusDate;

  ContactUsModel(
      {this.contactusId,
      this.contactusTitle,
      this.contactusTitleAr,
      this.contactusBody,
      this.contactusBodyAr,
      this.contactusDate});

  ContactUsModel.fromJson(Map<String, dynamic> json) {
    contactusId = json['contactus_id'];
    contactusTitle = json['contactus_title'];
    contactusTitleAr = json['contactus_title_ar'];
    contactusBody = json['contactus_body'];
    contactusBodyAr = json['contactus_body_ar'];
    contactusDate = json['contactus_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contactus_id'] = this.contactusId;
    data['contactus_title'] = this.contactusTitle;
    data['contactus_title_ar'] = this.contactusTitleAr;
    data['contactus_body'] = this.contactusBody;
    data['contactus_body_ar'] = this.contactusBodyAr;
    data['contactus_date'] = this.contactusDate;
    return data;
  }
}

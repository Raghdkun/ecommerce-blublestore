class TransactionModel {
  int? transactionId;
  int? transactionUsersid;
  int? transactionTotal;
  String? transactionDate;
  String? transactionImage;

  TransactionModel(
      {this.transactionId,
      this.transactionUsersid,
      this.transactionTotal,
      this.transactionDate,
      this.transactionImage});

  TransactionModel.fromJson(Map<String, dynamic> json) {
    transactionId = json['transaction_id'];
    transactionUsersid = json['transaction_usersid'];
    transactionTotal = json['transaction_total'];
    transactionDate = json['transaction_date'];
    transactionImage = json['transaction_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['transaction_id'] = this.transactionId;
    data['transaction_usersid'] = this.transactionUsersid;
    data['transaction_total'] = this.transactionTotal;
    data['transaction_date'] = this.transactionDate;
    data['transaction_image'] = this.transactionImage;
    return data;
  }
}
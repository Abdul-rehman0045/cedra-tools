class ClaimStatusResponseModel {
  int? id;
  int? userId;
  int? dayCount;
  String? lastClaimDate;
  int? totalBonus;
  String? createdAt;
  String? updatedAt;

  ClaimStatusResponseModel(
      {this.id,
      this.userId,
      this.dayCount,
      this.lastClaimDate,
      this.totalBonus,
      this.createdAt,
      this.updatedAt});

  ClaimStatusResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    dayCount = json['dayCount'];
    lastClaimDate = json['lastClaimDate'];
    totalBonus = json['totalBonus'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['dayCount'] = this.dayCount;
    data['lastClaimDate'] = this.lastClaimDate;
    data['totalBonus'] = this.totalBonus;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

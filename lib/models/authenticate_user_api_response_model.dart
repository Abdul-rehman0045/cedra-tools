class AuthenticateUserApiResponseModel {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? token;
  bool? isPasswordSet;
  String? createdAt;
  String? updatedAt;
  var coins;

  AuthenticateUserApiResponseModel(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.token,
      this.isPasswordSet,
      this.createdAt,
      this.updatedAt,
      this.coins});

  AuthenticateUserApiResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
    token = json['token'];
    isPasswordSet = json['isPasswordSet'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    coins = json['coins'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['token'] = this.token;
    data['isPasswordSet'] = this.isPasswordSet;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['coins'] = this.coins;
    return data;
  }
}

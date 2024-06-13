class LoginResponseModel {
  UserExist? userExist;

  LoginResponseModel({this.userExist});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    userExist = json['userExist'] != null
        ? new UserExist.fromJson(json['userExist'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userExist != null) {
      data['userExist'] = this.userExist!.toJson();
    }
    return data;
  }
}

class UserExist {
  int? id;
  String? name;
  String? email;
  String? password;
  String? token;
  bool? isPasswordSet;
  String? createdAt;
  String? updatedAt;
  var coins;

  UserExist(
      {this.id,
      this.name,
      this.email,
      this.password,
      this.token,
      this.isPasswordSet,
      this.createdAt,
      this.updatedAt,
      this.coins});

  UserExist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
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
    data['name'] = this.name;
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

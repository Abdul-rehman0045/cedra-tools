class ResponseModel {
  var status;
  String? message;
  var data;

  ResponseModel({this.status, this.message, this.data});

  ResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = json["data"];
  }
}

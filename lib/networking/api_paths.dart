
class ApiPaths {
  static const String localBaseUrl = "http://192.168.40.176:3009/api";
  // static const String localBaseUrl = "http://api.cedratools.com.mx/api";

  static const String productGetList = localBaseUrl + "/product/get-list";
  static const String login = localBaseUrl + "/auth/login";
  static const String authenticateUser = localBaseUrl + "/auth/authenticate-user";
  static const String generatePassword = localBaseUrl + "/auth/generate-password";
  // static usersJobs(id) => "/users/$id/jobs";
}

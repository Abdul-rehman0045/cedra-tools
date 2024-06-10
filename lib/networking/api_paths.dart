
class ApiPaths {
  // static const String localBaseUrl = "http://192.168.40.176:3009/api";
  static const String localBaseUrl = "https://api.cedratools.com.mx/api";

  static const String productGetList = localBaseUrl + "/product/get-list";
  static const String login = localBaseUrl + "/auth/login";
  static const String authenticateUser = localBaseUrl + "/auth/authenticate-user";
  static const String generatePassword = localBaseUrl + "/auth/generate-password";
  static const String changePassword = localBaseUrl + "/auth/change-password";
  static const String chaeckClaimStatus = localBaseUrl + "/auth/check-claim-status";
  static const String claimDailyBonus = localBaseUrl + "/auth/claim-daily-bonus";
  static const String productCheckout = "/product/checkout";
  // static usersJobs(id) => "/users/$id/jobs";
}

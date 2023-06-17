class TokenModel {
  late String accessToken;
  late String refreshToken;
  late String expiresAt;

  TokenModel.fromMap(Map<String, dynamic> map) {
    accessToken = map['access_token'];
    refreshToken = map['refresh_token'];
    expiresAt = map['expires_at'];
  }
}

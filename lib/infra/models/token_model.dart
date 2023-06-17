class TokenModel {
  late String accessToken;
  late String refreshToken;
  late String expiresAt;

  TokenModel.factory({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresAt,
  });

  TokenModel.fromMap(Map<String, dynamic> map) {
    accessToken = map['access_token'];
    refreshToken = map['refresh_token'];
    expiresAt = map['expires_at'];
  }

  Map<String, dynamic> toMap() => {
        'access_token': accessToken,
        'refresh_token': refreshToken,
        'expires_at': expiresAt,
      };
}

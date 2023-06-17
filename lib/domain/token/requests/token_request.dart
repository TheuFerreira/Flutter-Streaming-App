class TokenRequest {
  final String accessToken;
  final String refreshToken;
  final DateTime expiresAt;

  const TokenRequest({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresAt,
  });
}

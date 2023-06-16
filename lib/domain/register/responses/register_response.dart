class RegisterResponse {
  final String accessToken;
  final String refreshToken;
  final DateTime expiresAt;

  const RegisterResponse({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresAt,
  });
}

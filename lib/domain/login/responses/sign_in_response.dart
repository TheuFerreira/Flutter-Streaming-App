class SignInResponse {
  final String accessToken;
  final String refreshToken;
  final DateTime expiresAt;

  const SignInResponse({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresAt,
  });
}

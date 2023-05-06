class RememberMeRequest {
  final String user;
  final String password;
  final bool rememberMe;

  const RememberMeRequest({
    required this.user,
    required this.password,
    required this.rememberMe,
  });
}

class RegisterRequest {
  final String user;
  final String password;
  final String repeatPassword;
  final String email;

  const RegisterRequest({
    required this.user,
    required this.password,
    required this.repeatPassword,
    required this.email,
  });
}

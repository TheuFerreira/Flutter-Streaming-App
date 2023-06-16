class RegisterRequest {
  final String name;
  final String password;
  final String repeatPassword;
  final String email;

  const RegisterRequest({
    required this.name,
    required this.password,
    required this.repeatPassword,
    required this.email,
  });
}

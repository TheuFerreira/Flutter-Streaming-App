abstract class RegisterException implements Exception {}

class RegisterInvalidUserException extends RegisterException {}

class RegisterInvalidEmailException extends RegisterException {}

class RegisterInvalidPasswordException extends RegisterException {}

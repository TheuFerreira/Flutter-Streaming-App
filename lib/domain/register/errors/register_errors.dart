abstract class RegisterException implements Exception {}

class RegisterInvalidEmailException extends RegisterException {}

class RegisterInvalidPasswordException extends RegisterException {}

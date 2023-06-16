abstract class FetchException implements Exception {}

class FetchBadRequestException extends FetchException {}

class FetchNotFoundException extends FetchException {}

class FetchUnknownException extends FetchException {}

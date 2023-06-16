abstract class FetchException implements Exception {}

class FetchBadRequestException extends FetchException {}

class FetchUnknownException extends FetchException {}

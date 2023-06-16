class FetchResponse<T> {
  final int? statusCode;
  final T data;

  const FetchResponse({
    required this.statusCode,
    required this.data,
  });
}

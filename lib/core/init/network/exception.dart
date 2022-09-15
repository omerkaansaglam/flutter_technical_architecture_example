class NetworkError implements Exception {
  final int statusCode;
  final String message;

  NetworkError(this.statusCode, this.message);
}

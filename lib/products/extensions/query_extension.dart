extension QueryParameterExtension on int {
  Map<String, dynamic> parseQueryWithPage([int page = 1]) {
    return {'p': page, 'l': 10};
  }
}

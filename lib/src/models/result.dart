class Result {
  // *  the parsed body
  final Map<String, dynamic> body;

  // * the parsed query
  final Map<String, dynamic> query;

  Result({
    required this.body,
    required this.query,
  });

  Map<String, dynamic> toMap() {
    return {
      'body': body,
      'query': query,
    };
  }
}

/// Support for doing something awesome.
///
/// More dartdocs go here.
library body_parser;

import 'dart:io';

import 'package:palace_body_parser/src/models/result.dart';

export 'src/models/result.dart';

Future<Result> parseIoReq(HttpRequest request) async {
  return Result(body: {}, query: {});
}

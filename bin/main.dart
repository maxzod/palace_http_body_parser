import 'package:palace/palace.dart';
import 'package:palace_body_parser/body_parser.dart';

void main(List<String> args) {
  final palace = Palace();
  palace.get('/max/foo', (req, res) async {
    final result = await parseIoReq(req.request);
    // print(req.request.uri.authority);
    // print(req.request.uri.origin);
    // print(req.request.uri.path);
    // print(req.request.uri.pathSegments);
    // print(req.request.uri.queryParameters['aaaa'].runtimeType);
    // print(req.request.uri.queryParametersAll);
    // print(req.request.uri.scheme);
    // res.send(req.request.uri.queryParameters['aaaa'].runtimeType);
    res.send(result.toMap());
  });
  palace.openGates();
}

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:palace_body_parser/body_parser.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import 'dart:io';

void main() {
  // * http client
  Dio? dio;
  // * server url
  const url = 'http://localhost:3000/';
  // * http server
  HttpServer? server;

  setUp(
    () async {
      dio = Dio(BaseOptions(validateStatus: (_) => true));

      server = await HttpServer.bind('127.0.0.1', 3000);
      //  ? listen for the incoming requests
      server!.listen((req) async {
        final result = await parseIoReq(req);

        req.response.headers.add('content-type', 'application/json');

        req.response.write(jsonEncode(result.toMap()));

        req.response.close();
      });
    },
  );
  tearDown(
    () async {
      // * close the server
      await server?.close();
      dio = null;
      server = null;
    },
  );

  test('parse 1D array', () async {
    final res = await dio!.get(
      url,
      queryParameters: {
        'list': [1, 2, 3]
      },
    );

    expect(res.data['list'], isA<List>());
    expect(res.data['list'], equals([1, 2, 3]));
  });
  test('parse 2D array', () async {
    final res = await dio!.get(
      url,
      queryParameters: {
        'list': [
          1,
          [02, 12, 32],
          3,
        ]
      },
    );

    expect(res.data['list'], isA<List>());
    expect(
      res.data['list'],
      equals(
        [
          1,
          [02, 12, 32],
          3,
        ],
      ),
    );
  });
  test('parse 3D array', () async {
    final res = await dio!.get(
      url,
      queryParameters: {
        'list': [
          1,
          [
            02,
            12,
            32,
            [023, 123, 223],
          ],
          3,
        ]
      },
    );

    expect(res.data['list'], isA<List>());
    expect(
      res.data['list'],
      equals(
        [
          1,
          [
            02,
            12,
            32,
            [023, 123, 223],
          ],
          3,
        ],
      ),
    );
  });
}

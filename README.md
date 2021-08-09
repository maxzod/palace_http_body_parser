# [**`Part of Queen Palace 🏰👑`**](https://pub.dev/packages/palace)

# Palace Validators

# Motivation

- extraction the body and the query from the ` dart:io` `HttpRequest ` class is hard process which requires to be in separated package ,
- this package responsibility is to take `HttpRequest` object parse the query and the body and return the result

# Content

- `Future<Result> parseIoReq(HttpRequest request)`

# Features

## Query

- [ ] parse multidimensional arrays

## Body

- [ ] parse files in multipart
- [ ] parse application/json
- [ ] parse form-data
- [ ] parse x-www-form-urlencoded
- [ ] parse raw json

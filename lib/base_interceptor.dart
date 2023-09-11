import 'dart:async';

import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/request/request.dart';

abstract class BaseInterceptor<T> {
  FutureOr<Request<T>> requestInterceptor(Request<T?> request);

  FutureOr responseInterceptor(Request<T?> request, Response<T?> response);
}

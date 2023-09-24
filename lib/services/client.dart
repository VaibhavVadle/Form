import 'package:flutter_ok_http_client/flutter_ok_http_client.dart';

import '../core/constants/app_constants.dart';
import '../core/utils/connectivity_utils.dart';
import '../model/base_response.dart';

class AppClient {
  final OkHttpClient _client = OkHttpClient.builder()
      .setOptions(BaseOptions(baseUrl: 'http://3.110.120.210:3006/api/'))
      .addAllInterceptors([_AuthInterceptor(), _LogInterceptor()]);

  Future<Result<BaseResponse<dynamic>, String>> handleRequest(
    Request request,
  ) async {
    try {
      if (await ConnectivityUtils.isConnected) {
        Response<dynamic> response = await _client.newCall(request).execute();

        BaseResponse baseResponse = BaseResponse.fromResponse(response.data);

        if (response.statusCode == 200 || response.statusCode == 201) {
          if (baseResponse.status) {
            return Success(baseResponse);
          } else {
            return Failure(baseResponse.message);
          }
        } else {
          return Failure(baseResponse.message);
        }
      } else {
        return Failure(kNoInternetConnection);
      }
    } on OkHttpClientException catch (e) {
      return Failure(e.cause);
    }
  }
}

abstract class Result<S, F> {
  T when<T>(T Function(S value) ifSuccess, T Function(F error) ifFailure);
}

class Success<S, F> extends Result<S, F> {
  final S _value;

  Success(this._value);

  S get value => _value;

  @override
  T when<T>(T Function(S s) ifSuccess, T Function(F f) ifFailure) =>
      ifSuccess(_value);
}

class Failure<S, F> extends Result<S, F> {
  final F _value;

  Failure(this._value);

  F get value => _value;

  @override
  T when<T>(T Function(S s) ifSuccess, T Function(F f) ifFailure) =>
      ifFailure(_value);
}

class _LogInterceptor extends LogInterceptor {
  _LogInterceptor()
      : super(
          request: false,
          requestBody: true,
          responseHeader: false,
          responseBody: true,
        );
}

class _AuthInterceptor extends Interceptor {
  // @override
  // void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
  //   super.onRequest(options, handler);

  // bool isLogged = preferences.isLogged;
  // String? token = preferences.token;

  // if (isLogged && token != null) {
  //   options.headers = HeaderBuilder.builder().setBearerToken(token).build();
  // }
  // }

  // @override
  // void onError(DioError err, ErrorInterceptorHandler handler) {
  //   super.onError(err, handler);
  //   if (err.response?.statusCode == 401) {
  //     preferences.clear();
  //     BuildContext? context = kNavigatorKey.currentContext;
  //     if (context == null) return;
  //     Navigator.pushNamedAndRemoveUntil(
  //       context,
  //       Routes.nextRoute,
  //       (Route<dynamic> route) => false,
  //     );
  //   }
  // }
}

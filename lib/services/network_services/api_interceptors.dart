import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ev_business_logic/services/network_services/api_headers.dart';
import 'package:ev_business_logic/services/network_services/api_result.dart';

class ApiInterceptors {
  getInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) async {
        Map<String, dynamic> headers = await ApiHeaders.getHeaders();
        options.headers = headers;
        return handler.next(options);
      },
      onResponse: (response, handler) async {
        var data = response.data;
        if (response.data.runtimeType == String) {
          data = jsonDecode(data);
        }
        Map<String, dynamic> res = data;
        if (response.statusCode == 200 && data['success']) {
          response.data = ApiResult.success(
            data: data['data'],
            message: data['message'],
          );
        } else {
          response.data = ApiResult.failure(error: data['message']);
        }

        return handler.next(response);
      },
      onError: (e, handler) async {
        if (e.response != null) {
          await handleSessionTimeout(e.response!);
          await handleSocketException();
        }
        e.response?.data = ApiResult.failure(error: Exception(e.toString()));
        return handler.next(e);
      },
    );
  }

  handleSessionTimeout(Response response) async {
    if (response.statusCode == 401) {
      // Fluttertoast.showToast(
      //   msg: 'Session expired',
      //   toastLength: Toast.LENGTH_SHORT,
      //   gravity: ToastGravity.CENTER,
      //   backgroundColor: Colors.red,
      //   textColor: Colors.white,
      //   fontSize: 16.0,
      // );
      // remove the stored user since token has expired and user cannot tap to login if the token is expired'
      //! TODO:
      // await AuthBloc().removeCurrentUserStoredInLoggedInUsers();
      // AuthenticationRepository().logOut();
    }
  }

  handleSocketException() async {
    // if (NavigationService.navigatorKey.currentContext != null) {
    //   ScaffoldMessenger.of(NavigationService.navigatorKey.currentContext!)
    //       .showSnackBar(SnackBar(
    //     backgroundColor: null,
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(10),
    //     ),
    //     behavior: SnackBarBehavior.floating,
    //     content: const Text(
    //       'Please check your internet connection',
    //       style: TextStyle(fontWeight: FontWeight.bold),
    //     ),
    //     duration: const Duration(seconds: 3),
    //   ));
    // }
    // TODO: Handle socket exception
    // return Response(
    //   {'message': 'Please check your internet connection'},
    //   statusCode: 502,
    //   requestOptions: RequestOptions(),
    // );
  }
}
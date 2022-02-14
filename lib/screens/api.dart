import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class API{

  static Future<List<User>> getUsers() async {
    int total = 0;
    List<User> users = [];

    var paramsForRequest = {
      'page': 1,
    };
    final response2 =
    await DIO.shared()!.get('users', queryParameters: paramsForRequest);
    print(response2);
    users = List<User>.from(response2.data['data'].map((x) => User.fromJson(x)));
    return users;
  }
}

class User{
  String? id;
  String? firstname;
  String? lastname;
  String? email;
  String? url;

  User({this.id, this.firstname, this.lastname, this.email, this.url});

  Map<String, dynamic> toJson() => {
    'id': id,
    'first_name': firstname,
    'last_name': lastname,
    'email': email,
    'avatar': url,
  };

  User.fromJson(Map<String, dynamic> json) {
   id = json['name'];
   firstname = json['first_name'];
   lastname = json['last_name'];
   email = json['email'];
   url = json['avatar'];
  }
}

class DIO {
  static Dio? _dio;
  static const String BASE_URL = "https://reqres.in/api/";

  static final accessKey = "LRWG0q2WW7oH14k4qOSBju204gS5fAHsDQHPry";
  static final clientId = "7644f415c03c934174b1790660422eb6";

  static Dio? shared() {
    if (DIO._dio == null) {
      var dio = new Dio();
      dio.options.baseUrl = BASE_URL;
      dio.options.connectTimeout = 20000;
      dio.options.receiveTimeout = 20000;

      dio.interceptors
          .add(InterceptorsWrapper(onRequest: (RequestOptions r,handler) async {
        //Remove null
        r.queryParameters.removeWhere(((k, v) => v == null));

        //Platform
        var platform;
        if (Platform.isAndroid) {
          platform = 'android';
        } else if (Platform.isIOS) {
          platform = 'ios';
        }
        r.headers["Client-Platform"] = platform;
        // print(platform);
        //Auth
        // var token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiIwZDIzYjU1NS0xZjQ1LTQ3ZjQtYTFiYy1jYTlmNDY0YjViNTMiLCJsYXN0TG9nb3V0IjoiMjAxOS0wNS0xN1QwOTo0Mjo0MVoiLCJpYXQiOjE1NTk4ODA3MDJ9.eyXFXk9b5300Wu95hzL2NT4oAfNrKfLTGExfeqM70i4';
        SharedPreferences prefs = await SharedPreferences.getInstance();
        var token = prefs.getString('token');
        // print(token);
        if (token != null && token.isNotEmpty) {
          r.headers["Authorization"] = "Bearer $token";
        } else {
          var header = "$clientId:$accessKey";
          var encodedHeader = utf8.encode(header);
          var base64Str = base64.encode(encodedHeader);
          r.headers["Authorization"] = "Basic $base64Str";
        }
        if (r.method == 'PUT') {
          r.headers["expecting-response"] = "full";
        }
        print(r.uri);
        print(r.data);
        return handler.next(r);
      }, onError: (DioError e,handler) {
        // Do something with response error
        print('API ERROR');
        print(e);
        print(e.message);
        print(e.error);
        print(e.response);
        return handler.next(e); //continue
        // return dio.reject(DscvrError(e));
        // return e; //continue
      }));

      // dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));

      DIO._dio = dio;
    }
    return DIO._dio;
  }
}
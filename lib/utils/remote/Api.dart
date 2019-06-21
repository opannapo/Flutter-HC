import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hc/AppConfig.dart';
import 'package:hc/entities/HomeEntity.dart';
import 'package:hc/utils/remote/Urls.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'APIThrowBody.dart';

Map<String, String> _baseHeaders = {
  'Content-type': 'application/json',
  'Accept': 'application/json',
};

enum REQUEST_TYPE {
  POST,
  GET,
}

class API {
  Urls urls;

  API(BuildContext context) {
    urls = new Urls(AppConfig.of(context).baseUrl);
  }

  static _log(String msg) {
    print('API => $msg');
  }

  Future<dynamic> _exe(REQUEST_TYPE reqType, String url,
      Map<String, String> headers, Map<String, dynamic> body) async {
    var res;
    if (reqType == REQUEST_TYPE.POST) {
      res = await http.post(
        url,
        headers: headers,
        body: jsonEncode(body),
      );
    } else {
      res = await http.get(
        url,
        headers: headers,
      );
    }

    _log(
        '_exe ${res.request.url} :res.statusCode :  ${res.statusCode}, res.body : ${res.body}');

    return res;
  }

  Future<Map<String, dynamic>> home() async {
    Response res = await _exe(
      REQUEST_TYPE.GET,
      urls.home,
      _baseHeaders,
      null,
    );

    try {
      return {
        'homeEntity': HomeEntity.fromJson(jsonDecode(res.body)),
      };
    } catch (e) {
      _log('home : Failed response body => $e');
      if (e is APIThrowBody) {
        throw e;
      } else {
        throw new APIThrowBody(e, 'Failed response body!', res.statusCode);
      }
    }
  }
}

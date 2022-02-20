import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:fk_user_agent/fk_user_agent.dart';
import 'package:http/http.dart';
import 'package:waifuspics/ApiCallResults.dart';

String URL = "https://api.waifu.pics/sfw/waifu";

Future<String?> initPlatformState() async {
  WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {
    await FkUserAgent.init();
  });
  String? platformVersion;
  // Platform messages may fail, so we use a try/catch PlatformException.
  try {
    platformVersion = FkUserAgent.userAgent;
    if (kDebugMode) {
      print(platformVersion);
    }
    return platformVersion;
  } on PlatformException {
    platformVersion =
        "Mozilla/5.0 (X11; Linux x86_64; rv:97.0) Gecko/20100101 Firefox/97.0";
    return platformVersion;
  }
}

Future<List<String>> getURLFromApi(int pics) async {
  //String? userAgent = await initPlatformState();
  List<String> imagesUrls = [];
  var client = http.Client();
  try {
    for (int i = 0; i < pics; i++) {
      Response response = await client.get(Uri.parse(URL));
      if (response.statusCode == 200) {
        ApiCallResults parsed =
            ApiCallResults.fromJson(jsonDecode(response.body));
        imagesUrls.add(parsed.url);
      }
    }
    return imagesUrls;
  } finally {
    client.close();
  }
}

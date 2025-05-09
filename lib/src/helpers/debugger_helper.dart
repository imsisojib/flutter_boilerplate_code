import 'package:flutter/foundation.dart';
import 'package:flutter_boilerplate_code/di_container.dart';
import 'package:logger/logger.dart';

class Debugger{
  static void debug({String? title, dynamic data, dynamic statusCode}){
    if(kDebugMode){
      //only show console messages in Debug-Mode
      if(statusCode==null){
        sl<Logger>().d(title,error: data);
      }else{
        sl<Logger>().d(title,error: "Response-Code: $statusCode\nResponse-Body: $data",);
      }
    }
  }

  static void info({String? title, dynamic data, dynamic statusCode}){
    if(kDebugMode){
      //only show console messages in Debug-Mode
      if(statusCode==null){
        sl<Logger>().i(title,error: data,);
      }else{
        sl<Logger>().i(title,error: "Response-Code: $statusCode\nResponse-Body: $data",);
      }
    }
  }

  static void error({String? title, dynamic data, dynamic statusCode}){
    if(kDebugMode){
      //only show console messages in Debug-Mode
      if(statusCode==null){
        sl<Logger>().e(title,error: data,);
      }else{
        sl<Logger>().e(title,error: "Response-Code: $statusCode\nResponse-Body: $data",);
      }
    }
  }
}
import 'package:connectivity_plus/connectivity_plus.dart';


class ConnectivityHelper{
  static Future<bool> hasInternetConnection() async {
    /*try {
      final result = await InternetAddress.lookup('https://www.google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }*/

    try{
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile || connectivityResult ==ConnectivityResult.wifi || connectivityResult ==ConnectivityResult.ethernet) {
        // I am connected to a mobile network.
        return true;
      }else{
        return false;
      }
    }catch(e){
      //by default returning 'true' to avoid platform specific errors and also using in Unit-Testing
      return true;
    }

  }
}
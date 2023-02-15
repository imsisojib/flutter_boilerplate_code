import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey  = GlobalKey<NavigatorState>();

  Future<dynamic> pushNamedANdRemoveUntil(String routeName)async {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(routeName,(params)=>false);
  }

  Future<dynamic> pushNamed(String routeName)async {
    return navigatorKey.currentState!.pushNamed(routeName,);
  }

}
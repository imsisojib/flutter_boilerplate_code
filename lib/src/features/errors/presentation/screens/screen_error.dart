import 'package:flutter/material.dart';

class ScreenError extends StatelessWidget{
  const ScreenError({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(child: Text("Page Not Found!"),),
      ),
    );
  }
}
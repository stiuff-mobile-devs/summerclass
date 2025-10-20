import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:summerclass/app/modules/splash/controller/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Loading..')),

      body: SafeArea(child: Text('Conteudo')),
    );
  }
}

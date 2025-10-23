import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:summerclass/app/modules/dashboard/controller/home_controller.dart';
import 'package:summerclass/app/modules/movies/ui/movies_list_view.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Summer Class Movies'), centerTitle: true),

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.yellow, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: MoviesListView(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:summerclass/app/modules/movies/controller/movies_controller.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

class MoviesListView extends GetView<MoviesController> {
  const MoviesListView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> titles = [
      "RED",
      "YELLOW",
      "BLACK",
      "CYAN",
      "BLUE",
      "GREY",
      "",
    ];

    final List<Widget> images = [
      Container(color: Colors.red),
      Container(color: Colors.yellow),
      Container(color: Colors.black),
      Container(color: Colors.cyan),
      Container(color: Colors.blue),
      Container(color: Colors.grey),
      Container(
        color: Colors.transparent,
        child: Center(
          child: Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(color: Colors.black),
            child: const Icon(Icons.add, size: 40, color: Colors.white),
          ),
        ),
      ),
    ];
    return VerticalCardPager(
      titles: titles, // required
      images: images, // required
      textStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ), // optional
      onPageChanged: (page) {
        // optional
      },
      onSelectedItem: (index) {
        // optional
      },
      initialPage: 0, // optional
      align: ALIGN.CENTER, // optional
      physics: ClampingScrollPhysics(), // optional
    );
  }
}

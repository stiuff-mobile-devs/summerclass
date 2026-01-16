import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:summerclass/app/modules/movies/controller/movies_controller.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

class MoviesListView extends GetView<MoviesController> {
  const MoviesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      }

      final titles = [
        ...controller.movies.map((movie) => movie.title),
        ""
      ];

      final images = [
        ...controller.movies.map((movie) {
          DecorationImage? decorationImage;
          if (movie.imageBase64 != null && movie.imageBase64!.isNotEmpty) {
            final bytes = base64Decode(movie.imageBase64!);
            decorationImage = DecorationImage(
              image: MemoryImage(bytes),
              fit: BoxFit.cover,
            );
          }
          
          return Container(
            decoration: BoxDecoration(
              image: decorationImage,
              color: Colors.blue,
            ),
            child: Container(
              color: Colors.black.withValues(alpha: 0.3),
            ),
          );
        }),

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
        titles: titles,
        images: images,
        textStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        onPageChanged: (page) {},
        onSelectedItem: (index) {
          if (index == images.length - 1) {
            controller.addNewMovie();
          }
        },
        initialPage: 0,
        align: ALIGN.CENTER,
        physics: ClampingScrollPhysics(),
      );
    });
  }
}

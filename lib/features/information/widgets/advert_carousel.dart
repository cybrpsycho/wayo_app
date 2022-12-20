import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AdvertCarousel extends StatelessWidget {
  const AdvertCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4 / 3,
      child: CarouselSlider(
        items: [1, 2].map((e) {
          return const Placeholder();
        }).toList(),
        options: CarouselOptions(
          autoPlay: true,
          height: double.infinity,
          enlargeCenterPage: true,
          autoPlayInterval: const Duration(seconds: 5),
        ),
      ),
    );
  }
}

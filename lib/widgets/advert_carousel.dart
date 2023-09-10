import "package:carousel_slider/carousel_slider.dart";
import "package:flutter/material.dart";

class AdvertCarousel extends StatelessWidget {
  const AdvertCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final imageList = [
      "assets/images/949388dc16ffff9cc0e8051a9e2aa353.jpeg",
      "assets/images/Big-Square-Two-Rivers-Mall-Nairobi-Valentine-Offers-2.jpeg",
      "assets/images/fashion-sale-banner-square-flyer-social-media-post-template_169869-218.jpeg",
      "assets/images/female-handbags-ads-social-media-post-design-template-4b2b374e779d6632519dac5bb431b8c7_screen.jpeg",
    ];
    return AspectRatio(
      aspectRatio: 4 / 3,
      child: CarouselSlider(
        items: imageList.map((e) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(e)),
            ),
          );
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

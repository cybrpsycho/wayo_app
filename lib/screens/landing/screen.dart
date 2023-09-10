import "package:cached_network_image/cached_network_image.dart";
import "package:carousel_slider/carousel_slider.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:sized_context/sized_context.dart";

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final imageList = [
    "https://firebasestorage.googleapis.com/v0/b/wayo-254.appspot.com/o/adverts%2Fad-diesel.jpg?alt=media&token=dd947d0d-edc0-4400-8449-916aab7d19f1",
    "https://firebasestorage.googleapis.com/v0/b/wayo-254.appspot.com/o/adverts%2Fad-fashion-shop03.jpg?alt=media&token=e462b431-e8d9-4219-9e6a-4d47c6e9131d",
    "https://firebasestorage.googleapis.com/v0/b/wayo-254.appspot.com/o/adverts%2Fad-max-shoes.jpg?alt=media&token=1a3efcf1-4faa-4d49-93a8-7343592d1b16",
    "https://firebasestorage.googleapis.com/v0/b/wayo-254.appspot.com/o/adverts%2Fad-pizza-hut.jpg?alt=media&token=cb40076d-8207-4be5-b07d-ddc15f7e90fe",
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: context.heightPct(0.85),
          child: CarouselSlider(
            items: imageList.map((e) {
              return CachedNetworkImage(
                imageUrl: e,
                progressIndicatorBuilder: (context, url, progress) {
                  return Center(
                    child: CircularProgressIndicator(value: progress.progress),
                  );
                },
                fit: BoxFit.cover,
              );
            }).toList(),
            options: CarouselOptions(
              autoPlay: true,
              height: double.infinity,
              viewportFraction: 1,
              autoPlayInterval: const Duration(seconds: 5),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            elevation: 0,
            child: Container(
              padding: const EdgeInsets.all(24),
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Tagline"),
                  const SizedBox(height: 8),
                  const Text("with 2 lines of text"),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => context.goNamed("Home"),
                    child: const Text("CONTINUE"),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

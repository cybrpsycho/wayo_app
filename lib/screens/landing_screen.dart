import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sized_context/sized_context.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final imageList = [
    'assets/images/landing_1.jpg',
    'assets/images/landing_2.jpg',
    'assets/images/landing_3.jpg',
    'assets/images/landing_4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: context.heightPct(0.85),
          child: CarouselSlider(
            items: imageList.map((e) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(e),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }).toList(),
            options: CarouselOptions(
              autoPlay: true,
              height: double.infinity,
              // enlargeCenterPage: true,
              viewportFraction: 1,
              autoPlayInterval: const Duration(seconds: 5),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.all(24),
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Tagline'),
                const SizedBox(height: 8),
                const Text('with 2 lines of text'),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => context.goNamed('Home'),
                  child: const Text('CONTINUE'),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

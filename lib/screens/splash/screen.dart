import "package:flutter/material.dart";
import "package:get_it/get_it.dart";
import "package:go_router/go_router.dart";
import "package:wayo/blocs/app_bloc/app_bloc.dart";
import "package:wayo/config/enums.dart";

import "widgets/image_slider.dart";

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _rowImages = [
    [
      "row1/0.png",
      "row1/1.png",
      "row1/2.png",
      "row1/3.png",
    ],
    [
      "row2/0.png",
      "row2/1.png",
      "row2/2.png",
      "row2/3.png",
      "row2/4.png",
    ],
    [
      "row3/0.png",
      "row3/1.png",
      "row3/2.png",
      "row3/3.png",
    ],
    [
      "row4/0.png",
      "row4/1.png",
      "row4/2.png",
      "row4/3.png",
    ]
  ];

  final _animationDuration = const Duration(seconds: 3);

  @override
  void initState() {
    super.initState();

    Future.delayed(
      _animationDuration,
      () {
        final state = GetIt.I.get<AppBloc>().state;

        if (state.status == BlocStatus.success) {
          if (state.isFirstRun) {
            GoRouter.of(context).goNamed("onboarding");
          } else {
            GoRouter.of(context).goNamed("home");
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: ImageSlider(
                imagePaths: _rowImages[0],
                duration: _animationDuration,
              ),
            ),
            Expanded(
              child: ImageSlider(
                imagePaths: _rowImages[1],
                duration: _animationDuration,
                isReversed: true,
              ),
            ),
            Expanded(
              child: ImageSlider(
                imagePaths: _rowImages[2],
                duration: _animationDuration,
              ),
            ),
            Expanded(
              child: ImageSlider(
                imagePaths: _rowImages[3],
                duration: _animationDuration,
                isReversed: true,
              ),
            ),
          ],
        ),
        Center(
          child: Container(
            width: 240,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black, width: 8),
            ),
            child: Transform.translate(
              offset: const Offset(0, 2),
              child: Image.asset("assets/images/logo.png"),
            ),
          ),
        )
      ],
    );
  }
}

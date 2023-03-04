import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sized_context/sized_context.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  final _animationDuration = const Duration(milliseconds: 400);

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: _animationDuration);
    _controller.forward(from: 0);
    _controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        await Future.delayed(const Duration(seconds: 1));
        _controller.reverse().then((value) {
          context.goNamed('Landing');
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Stack(
          children: [
            // TOP LEFT
            AnimatedPositioned(
              top: lerpDouble(-50, 0, _controller.value),
              left: lerpDouble(-50, 0, _controller.value),
              width: context.widthPct(0.5),
              height: context.heightPct(0.45),
              duration: _animationDuration,
              child: AnimatedOpacity(
                duration: _animationDuration,
                opacity: lerpDouble(0, 1, _controller.value)!,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 8,
                      strokeAlign: StrokeAlign.center,
                    ),
                  ),
                  child: Image.asset(
                    'assets/images/splash_1.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // TOP RIGHT
            AnimatedPositioned(
              top: lerpDouble(-50, 0, _controller.value),
              right: lerpDouble(-50, 0, _controller.value),
              width: context.widthPct(0.5),
              height: context.heightPct(1 / 3),
              duration: _animationDuration,
              child: AnimatedOpacity(
                duration: _animationDuration,
                opacity: lerpDouble(0, 1, _controller.value)!,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 8,
                      strokeAlign: StrokeAlign.center,
                    ),
                  ),
                  child: Image.asset(
                    'assets/images/splash_2.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // MID RIGHT
            AnimatedPositioned(
              top: context.heightPct(1 / 3),
              right: lerpDouble(-50, 0, _controller.value),
              width: context.widthPct(0.5),
              height: context.heightPct(1 / 3),
              duration: _animationDuration,
              child: AnimatedOpacity(
                duration: _animationDuration,
                opacity: lerpDouble(0, 1, _controller.value)!,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 8,
                      strokeAlign: StrokeAlign.center,
                    ),
                  ),
                  child: Image.asset(
                    'assets/images/splash_3.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // BOTTOM LEFT
            AnimatedPositioned(
              bottom: lerpDouble(-50, 0, _controller.value),
              left: lerpDouble(-50, 0, _controller.value),
              width: context.widthPct(0.5),
              height: context.heightPct(0.55),
              duration: _animationDuration,
              child: AnimatedOpacity(
                duration: _animationDuration,
                opacity: lerpDouble(0, 1, _controller.value)!,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 8,
                      strokeAlign: StrokeAlign.center,
                    ),
                  ),
                  child: Image.asset(
                    'assets/images/splash_4.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // BOTTOM RIGHT
            AnimatedPositioned(
              bottom: lerpDouble(-50, 0, _controller.value),
              right: lerpDouble(-50, 0, _controller.value),
              width: context.widthPct(0.5),
              height: context.heightPct(1 / 3),
              duration: _animationDuration,
              child: AnimatedOpacity(
                duration: _animationDuration,
                opacity: lerpDouble(0, 1, _controller.value)!,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 8,
                      strokeAlign: StrokeAlign.center,
                    ),
                  ),
                  child: Image.asset(
                    'assets/images/splash_5.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedScale(
                duration: _animationDuration,
                scale: lerpDouble(2, 1, _controller.value)!,
                child: AnimatedOpacity(
                  duration: _animationDuration,
                  opacity: lerpDouble(0, 1, _controller.value)!,
                  child: Container(
                    margin: EdgeInsets.only(bottom: context.heightPct(0.288)),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 8),
                    ),
                    child: const Text(
                      'WAYO',
                      style: TextStyle(
                        fontSize: 32,
                        fontVariations: [FontVariation('wght', 900)],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

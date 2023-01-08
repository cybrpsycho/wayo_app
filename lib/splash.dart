import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final Future _timer;

  @override
  void initState() {
    super.initState();
    _timer = Future.delayed(
      const Duration(seconds: 1),
      () => context.goNamed('home'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _timer,
      builder: (context, snapshot) {
        return Stack(
          children: const [
            Placeholder(),
            Center(
              child: Text('Intro Animation/Logo'),
            )
          ],
        );
      },
    );
  }
}

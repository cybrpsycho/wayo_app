import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

import "widgets/page_button.dart";
import "widgets/page_content.dart";
import "widgets/page_indicators.dart";

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController(initialPage: 0);
  final _pageAnimDuration = const Duration(milliseconds: 300);

  int get _page {
    if (_controller.positions.isEmpty) return 0;
    return (_controller.page ?? 0).round();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: PageView(
              controller: _controller,
              onPageChanged: onPageChanged,
              scrollDirection: Axis.horizontal,
              children: const [
                PageContent(
                  imagePath: "assets/images/onboarding/store_info.svg",
                  caption: "Get information about a store and plan your visit!",
                ),
                PageContent(
                  imagePath: "assets/images/onboarding/indoor_navigation.svg",
                  caption:
                      "Get directions  to the doorstep of your favourite shop!",
                ),
                PageContent(
                  imagePath: "assets/images/onboarding/satisfied_shopper.svg",
                  caption: "Never get lost again!",
                ),
              ],
            ),
          ),
          if (_page != 0)
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: PageButton(
                  icon: const Icon(Icons.chevron_left_rounded),
                  onPressed: openPreviousPage,
                  tooltip: "Previous",
                ),
              ),
            ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: PageButton(
                icon: Icon(_page == 2
                    ? Icons.check_rounded
                    : Icons.chevron_right_rounded),
                onPressed: openNextPage,
                tooltip: "Next",
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(36),
              child: PageIndicators(page: _page),
            ),
          )
        ],
      ),
    );
  }

  void onPageChanged(int value) => setState(() {});

  void openPreviousPage() async {
    if (_page == 0) return;

    await _controller.animateToPage(
      _page - 1,
      duration: _pageAnimDuration,
      curve: Curves.easeIn,
    );
  }

  void openNextPage() async {
    if (_page == 2) return context.goNamed("home");

    await _controller.animateToPage(
      _page + 1,
      duration: _pageAnimDuration,
      curve: Curves.easeIn,
    );
  }
}

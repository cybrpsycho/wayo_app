import "package:flutter/material.dart";

class PageIndicators extends StatelessWidget {
  final int page;

  const PageIndicators({super.key, required this.page});

  final _indicatorSize = 8.0;
  final _indicatorMaxWidth = 24.0;
  final _animationDuration = const Duration(milliseconds: 150);

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      color: Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(4),
    );

    return SizedBox(
      width: 80,
      child: Row(
        children: [
          AnimatedContainer(
            height: _indicatorSize,
            width: page == 0 ? _indicatorMaxWidth : _indicatorSize,
            duration: _animationDuration,
            decoration: decoration,
          ),
          const Spacer(),
          AnimatedContainer(
            height: _indicatorSize,
            width: page == 1 ? _indicatorMaxWidth : _indicatorSize,
            duration: _animationDuration,
            decoration: decoration,
          ),
          const Spacer(),
          AnimatedContainer(
            height: _indicatorSize,
            width: page == 2 ? _indicatorMaxWidth : _indicatorSize,
            duration: _animationDuration,
            decoration: decoration,
          ),
        ],
      ),
    );
  }
}

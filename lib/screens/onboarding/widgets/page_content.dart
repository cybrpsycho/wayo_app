import "dart:ui";

import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";

class PageContent extends StatelessWidget {
  final String imagePath;
  final String caption;

  const PageContent({
    super.key,
    required this.imagePath,
    required this.caption,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 120),
        SvgPicture.asset(
          imagePath,
          fit: BoxFit.fitHeight,
          height: 300,
        ),
        const SizedBox(height: 24),
        Text(
          caption,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontVariations: [const FontVariation("wght", 900)],
          ),
        ),
      ],
    );
  }
}

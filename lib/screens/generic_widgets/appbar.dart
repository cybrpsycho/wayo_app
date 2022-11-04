import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GenericAppBar extends StatelessWidget {
  const GenericAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      height: kToolbarHeight,
      child: Row(
        children: [
          if (context.canPop())
            AspectRatio(
              aspectRatio: 1,
              child: IconButton(
                tooltip: 'Back',
                onPressed: () => context.pop(),
                icon: const Icon(FeatherIcons.arrowLeft),
              ),
            ),
          const Spacer(),
          AspectRatio(
            aspectRatio: 1,
            child: IconButton(
              tooltip: 'Notifications',
              onPressed: () {},
              icon: const Icon(FeatherIcons.bell),
            ),
          ),
        ],
      ),
    );
  }
}

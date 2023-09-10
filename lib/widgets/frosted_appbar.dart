import "dart:ui";

import "package:flutter/material.dart";
import "package:wayo/screens/notifications/notifications_screen.dart";

class FrostedAppBar extends StatelessWidget {
  final Widget? bottom;
  final Widget? title;

  const FrostedAppBar({super.key, this.title, this.bottom});

  get fallbackTitle {
    return Image.asset(
      "assets/images/logo.png",
      fit: BoxFit.contain,
      height: kToolbarHeight - 12,
    );
  }

  void _onNotificationAction(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const NotificationsScreen(),
    ));
  }

  List<Widget>? _buildNotificationButton(BuildContext context) {
    // if (GoRouter.of(context).location != "/notifications") {
    //   return [
    //     AspectRatio(
    //       aspectRatio: 1,
    //       child: IconButton(
    //         tooltip: "Notifications",
    //         onPressed: () => _onNotificationAction(context),
    //         icon: const Icon(Icons.notifications_outlined),
    //       ),
    //     )
    //   ];
    // }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface.withOpacity(0.7),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppBar(
                elevation: 0,
                title: title ?? fallbackTitle,
                centerTitle: true,
                backgroundColor: Colors.transparent,
                actions: _buildNotificationButton(context),
              ),
              if (bottom != null) const SizedBox(height: 8),
              if (bottom != null) Flexible(child: bottom ?? const SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}

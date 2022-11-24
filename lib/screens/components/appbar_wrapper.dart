import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppbarWrapper extends StatefulWidget {
  final Widget? appbarTitle;
  final PreferredSize? appbarBottom;
  final Widget body;

  const AppbarWrapper({
    super.key,
    this.appbarTitle,
    this.appbarBottom,
    required this.body,
  });

  @override
  State<AppbarWrapper> createState() => _AppbarWrapperState();
}

class _AppbarWrapperState extends State<AppbarWrapper> {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      clipBehavior: Clip.none,
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverAppBar(
          title: widget.appbarTitle,
          pinned: true,
          actions: [
            AspectRatio(
              aspectRatio: 1,
              child: IconButton(
                tooltip: 'Notifications',
                onPressed: () => context.goNamed('notifications'),
                icon: const Icon(Icons.notifications_rounded),
              ),
            ),
          ],
          bottom: widget.appbarBottom,
        )
      ],
      body: widget.body,
    );
  }
}

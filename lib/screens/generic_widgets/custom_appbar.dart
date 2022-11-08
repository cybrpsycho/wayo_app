import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatefulWidget {
  final String? title;
  final Widget? flexSpace;

  const CustomAppBar({super.key, this.title, this.flexSpace});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  final _rootPages = [
    '/home',
    '/search',
    '/discover',
    '/saved',
    '/menu',
    '/notifications',
  ];

  bool get isRootPage => _rootPages.contains(GoRouter.of(context).location);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: isRootPage
          ? null
          : IconButton(
              tooltip: 'Back',
              onPressed: () => context.pop(),
              icon: const Icon(FeatherIcons.arrowLeft),
            ),
      title: widget.title != null ? Text(widget.title!) : null,
      actions: [
        AspectRatio(
          aspectRatio: 1,
          child: IconButton(
            tooltip: 'Notifications',
            onPressed: () => context.goNamed('notifications'),
            icon: const Icon(FeatherIcons.bell),
          ),
        ),
      ],
    );
  }
}

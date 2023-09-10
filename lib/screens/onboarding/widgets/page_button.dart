import "package:flutter/material.dart";

class PageButton extends StatelessWidget {
  final Icon icon;
  final VoidCallback onPressed;
  final String? tooltip;

  const PageButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: icon,
        tooltip: tooltip,
        color: Theme.of(context).colorScheme.primary,
        onPressed: onPressed,
      ),
    );
  }
}

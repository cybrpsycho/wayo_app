import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";

class CustomIcon extends StatefulWidget {
  final String name;
  final double? size;

  const CustomIcon({super.key, required this.name, this.size = 24});

  @override
  State<CustomIcon> createState() => _CustomIconState();
}

class _CustomIconState extends State<CustomIcon> {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      "assets/icons/${widget.name}",
      width: widget.size,
      height: widget.size,
    );
  }
}

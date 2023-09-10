import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:text_scroll/text_scroll.dart";

class PreviewTile extends StatelessWidget {
  final String? imageUrl;
  final String? placeholderName;
  final VoidCallback? onTap;

  const PreviewTile({
    super.key,
    this.imageUrl,
    this.placeholderName,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: imageUrl != null
              ? CachedNetworkImage(imageUrl: imageUrl!, fit: BoxFit.cover)
              : Center(child: TextScroll(placeholderName ?? "undefined")),
        ),
      ),
    );
  }
}

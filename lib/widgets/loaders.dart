import "package:flutter/material.dart";
import "package:shimmer/shimmer.dart";

enum BuilderMode { squareTile, listTile }

class LoadingList extends StatelessWidget {
  final Axis direction;
  final EdgeInsetsGeometry? padding;
  final BuilderMode mode;
  final bool separated;

  const LoadingList({
    super.key,
    required this.mode,
    this.direction = Axis.vertical,
    this.separated = true,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: padding,
      scrollDirection: direction,
      itemBuilder: (context, index) {
        if (mode == BuilderMode.squareTile) {
          return AspectRatio(
            aspectRatio: 1,
            child: Shimmer.fromColors(
              period: const Duration(seconds: 1),
              baseColor: Colors.grey.withOpacity(0.2),
              highlightColor: Colors.grey.withOpacity(0.3),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          );
        }
        return ListTile(
          leading: AspectRatio(
            aspectRatio: 1,
            child: Shimmer.fromColors(
              period: const Duration(seconds: 1),
              baseColor: Colors.grey.withOpacity(0.2),
              highlightColor: Colors.grey.withOpacity(0.3),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
          title: Shimmer.fromColors(
            period: const Duration(seconds: 1),
            baseColor: Colors.grey.withOpacity(0.2),
            highlightColor: Colors.grey.withOpacity(0.3),
            child: Row(
              children: [
                SizedBox(
                  width: 120,
                  height: 18,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ],
            ),
          ),
          subtitle: Shimmer.fromColors(
            period: const Duration(seconds: 1),
            baseColor: Colors.grey.withOpacity(0.2),
            highlightColor: Colors.grey.withOpacity(0.3),
            child: Row(
              children: [
                SizedBox(
                  width: 200,
                  height: 12,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        if (!separated) return const SizedBox();
        return direction == Axis.horizontal
            ? const SizedBox(width: 16)
            : const SizedBox(height: 16);
      },
      itemCount: 6,
    );
  }
}

class LoadingGrid extends StatelessWidget {
  final SliverGridDelegate delegate;
  final EdgeInsetsGeometry? padding;

  const LoadingGrid({
    super.key,
    required this.delegate,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: padding,
      gridDelegate: delegate,
      itemBuilder: (context, index) {
        return AspectRatio(
          aspectRatio: 1,
          child: Shimmer.fromColors(
            period: const Duration(seconds: 1),
            baseColor: Colors.grey.withOpacity(0.2),
            highlightColor: Colors.grey.withOpacity(0.3),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        );
      },
      itemCount: 6,
    );
  }
}

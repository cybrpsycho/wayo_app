import 'package:flutter/material.dart';

class StoresPreviewGrid extends StatelessWidget {
  const StoresPreviewGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Column(
            children: [
              const Expanded(
                child: CircleAvatar(
                  maxRadius: 40,
                  child: Icon(Icons.storefront_outlined),
                ),
              ),
              Text('store ${index + 1}'),
            ],
          );
        },
        childCount: 12,
      ),
    );
  }
}

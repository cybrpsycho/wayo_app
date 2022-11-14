import 'package:flutter/material.dart';

class MallsPreviewList extends StatelessWidget {
  const MallsPreviewList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52 * 2,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        itemBuilder: (context, index) {
          return Column(
            children: [
              const Expanded(
                child: CircleAvatar(
                  maxRadius: 32,
                  child: Icon(Icons.storefront_outlined),
                ),
              ),
              Text('store ${index + 1}'),
            ],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        itemCount: 12,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

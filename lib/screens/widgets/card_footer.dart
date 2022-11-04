import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:wayo/models/mall.dart';

class CardFooter extends StatelessWidget {
  final Mall? mall;

  const CardFooter({super.key, required this.mall});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: const RoundedRectangleBorder(),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Row(
                children: [
                  const Icon(FeatherIcons.clock),
                  const SizedBox(width: 8),
                  Expanded(child: Text(mall?.hours ?? 'undefined')),
                ],
              ),
            ),
            const Flexible(child: SizedBox(height: 8)),
            Flexible(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(FeatherIcons.mapPin),
                  const SizedBox(width: 8),
                  Expanded(child: Text(mall?.address ?? 'undefined')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

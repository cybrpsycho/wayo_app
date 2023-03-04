import 'package:flutter/material.dart';
import 'package:wayo/configs/constants.dart';

class StatusIndicator extends StatelessWidget {
  final LoadingStatus status;

  const StatusIndicator({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case LoadingStatus.initial:
        return Center(
            child: Column(
          children: const [
            Text('Initializing'),
            SizedBox(height: 4),
            CircularProgressIndicator(),
          ],
        ));
      case LoadingStatus.loading:
        return const Center(child: CircularProgressIndicator());
      case LoadingStatus.failure:
        return const Center(child: Text('failed to load map'));
      default:
        return const SizedBox();
    }
  }
}

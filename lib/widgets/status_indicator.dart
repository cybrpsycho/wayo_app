import "package:flutter/material.dart";
import "package:wayo/config/enums.dart";

class StatusIndicator extends StatelessWidget {
  final BlocStatus status;

  const StatusIndicator({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case BlocStatus.initial:
        return Center(
            child: Column(
          children: const [
            Text("Initializing"),
            SizedBox(height: 4),
            CircularProgressIndicator(),
          ],
        ));
      case BlocStatus.loading:
        return const Center(child: CircularProgressIndicator());
      case BlocStatus.failure:
        return const Center(child: Text("failed to load map"));
      default:
        return const SizedBox();
    }
  }
}

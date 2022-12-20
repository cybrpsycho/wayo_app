import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../providers/map_bloc/map_bloc.dart';

class PhysicalMapScreen extends StatefulWidget {
  const PhysicalMapScreen({Key? key}) : super(key: key);

  @override
  State<PhysicalMapScreen> createState() => _PhysicalMapScreenState();
}

class _PhysicalMapScreenState extends State<PhysicalMapScreen> {
  late final MapBloc _mapBloc;

  final Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
    _mapBloc = context.read<MapBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapBloc, MapState>(
      bloc: _mapBloc,
      builder: (context, state) {
        return GoogleMap(
          initialCameraPosition: CameraPosition(
            target: state.location,
            zoom: 15,
          ),
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          onMapCreated: (controller) async {
            if (_controller.isCompleted) return;
            _controller.complete(controller);
            await controller.setMapStyle(state.mapThemeConfig);
            setState(() {});
          },
        );
      },
    );
  }
}

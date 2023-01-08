import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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

  final _controller = Completer<GoogleMapController>();

  @override
  void initState() {
    super.initState();
    _mapBloc = MapBloc()
      ..add(InitializeMap())
      ..add(GetCurrentLocation());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MapBloc, MapState>(
      bloc: _mapBloc,
      listener: (context, state) async {
        if (state.mapThemeConfig != null) {
          final controller = await _controller.future;
          await controller.setMapStyle(state.mapThemeConfig);
        }
      },
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
            _controller.complete(controller);

            final window = SchedulerBinding.instance.window;

            window.onPlatformBrightnessChanged = () async {
              _mapBloc.add(UpdateMapTheme(
                brightness: window.platformBrightness,
              ));
              await controller.setMapStyle(state.mapThemeConfig);
            };

            _mapBloc.add(UpdateMapTheme(
              brightness: window.platformBrightness,
            ));
          },
        );
      },
    );
  }
}

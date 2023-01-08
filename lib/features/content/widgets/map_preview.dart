import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wayo/configs/constants.dart';

import '../../navigation/providers/map_bloc/map_bloc.dart';

class MapPreview extends StatefulWidget {
  const MapPreview({super.key});

  @override
  State<MapPreview> createState() => _MapPreviewState();
}

class _MapPreviewState extends State<MapPreview> {
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
    return SizedBox(
      height: 240,
      child: BlocConsumer<MapBloc, MapState>(
        bloc: _mapBloc,
        listener: (context, state) async {
          if (state.mapThemeConfig != null) {
            final controller = await _controller.future;
            await controller.setMapStyle(state.mapThemeConfig);
          }
        },
        builder: (context, state) {
          log(state.status.name);
          switch (state.status) {
            case LoadingStatus.initial:
              return const Center(child: CircularProgressIndicator());
            case LoadingStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case LoadingStatus.failure:
              return const Center(child: Text('failed to load map'));
            case LoadingStatus.success:
              return GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: state.location,
                  zoom: 15,
                ),
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                zoomControlsEnabled: false,
                zoomGesturesEnabled: false,
                tiltGesturesEnabled: false,
                rotateGesturesEnabled: false,
                scrollGesturesEnabled: false,
                onTap: (argument) => context.goNamed('PhysicalMap'),
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
          }
        },
      ),
    );
  }
}

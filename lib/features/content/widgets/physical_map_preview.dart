import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wayo/configs/constants.dart';

import '../../navigation/providers/map_bloc/map_bloc.dart';

class PhysicalMapPreview extends StatefulWidget {
  const PhysicalMapPreview({super.key});

  @override
  State<PhysicalMapPreview> createState() => _PhysicalMapPreviewState();
}

class _PhysicalMapPreviewState extends State<PhysicalMapPreview> {
  late final MapBloc _mapBloc;

  final Completer<GoogleMapController> _controller = Completer();

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
      child: BlocBuilder<MapBloc, MapState>(
        bloc: _mapBloc,
        builder: (context, state) {
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
                onTap: (argument) => context.goNamed('physical_map'),
                onMapCreated: (controller) async {
                  if (_controller.isCompleted) return;
                  _controller.complete(controller);
                  await controller.setMapStyle(state.mapThemeConfig);
                  setState(() {});
                },
              );
          }
        },
      ),
    );
  }
}

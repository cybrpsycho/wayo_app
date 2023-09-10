import "dart:developer";

import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_map/flutter_map.dart";
import "package:latlong2/latlong.dart";
import "package:wayo/blocs/map_bloc/map_bloc.dart";
import "package:wayo/config/enums.dart";

class MapView extends StatefulWidget {
  final double zoom;
  final bool isInteractive;
  final List<LatLng> points;

  const MapView({
    super.key,
    this.zoom = 14,
    this.isInteractive = true,
    this.points = const [],
  });

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  late final MapBloc _mapBloc;

  @override
  void initState() {
    super.initState();
    _mapBloc = MapBloc()..add(InitializeMap());
  }

  @override
  Widget build(BuildContext context) {
    log("${widget.points}");
    return BlocBuilder<MapBloc, MapState>(
      bloc: _mapBloc,
      builder: (context, state) {
        log("$state");
        if (state.status == BlocStatus.success) {
          state as MapInitialized;
          return FlutterMap(
            options: MapOptions(
              center: state.myLocation,
              zoom: widget.zoom,
              interactiveFlags: widget.isInteractive
                  ? InteractiveFlag.pinchZoom | InteractiveFlag.drag
                  : InteractiveFlag.none,
            ),
            nonRotatedChildren: [
              MarkerLayer(
                markers: [
                  Marker(
                    point: state.myLocation,
                    width: 16,
                    height: 16,
                    builder: (context) {
                      return Icon(Icons.my_location, color: Colors.blue[600]);
                    },
                  ),
                  ...widget.points
                      .map(
                        (point) => Marker(
                          point: point,
                          builder: (context) {
                            return const Icon(
                              Icons.location_on_sharp,
                              color: Colors.blue,
                              size: 40,
                            );
                          },
                        ),
                      )
                      .toList(),
                ],
              ),
            ],
            children: [
              TileLayer(
                urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                userAgentPackageName: "com.wayo.app",
              ),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}

import "dart:developer";

import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:wayo/blocs/mall_bloc/mall_bloc.dart";
import "package:wayo/config/enums.dart";
import "package:wayo/screens/home/widgets/map_view.dart";
import "package:wayo/widgets/frosted_appbar.dart";

class PhysicalMapScreen extends StatefulWidget {
  const PhysicalMapScreen({super.key});

  @override
  State<PhysicalMapScreen> createState() => _PhysicalMapScreenState();
}

class _PhysicalMapScreenState extends State<PhysicalMapScreen> {
  late final MallBloc _mallBloc;

  @override
  void initState() {
    super.initState();
    _mallBloc = MallBloc()..add(const GetMalls());
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<MallBloc, MallState>(
          bloc: _mallBloc,
          builder: (context, state) {
            log("$state");
            if (state.status == BlocStatus.success) {
              state as MallsFetched;
              return MapView(
                points: state.malls.map((e) => e.coordinates).toList(),
              );
            }
            return const SizedBox();
          },
        ),
        const Align(
          alignment: Alignment.topCenter,
          child: FrostedAppBar(),
        ),
      ],
    );
  }
}

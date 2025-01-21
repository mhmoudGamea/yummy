import 'package:flutter/material.dart';

import '../../data/models/location_model.dart';
import 'widgets/map_view_body.dart';

class MapView extends StatelessWidget {
  static const String rn = '/mapView';
  final LocationModel locationModel;
  const MapView({super.key, required this.locationModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MapViewBody(locationModel: locationModel),
      ),
    );
  }
}

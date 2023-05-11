import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:yummy/core/constants.dart';
import 'package:yummy/core/utils/styles.dart';
import 'package:yummy/features/welcome/data/models/location_model.dart';

import '../../../../../core/widgets/c_expanded_button.dart';
import '../../model_views/location_cubit/location_cubit.dart';

class MapViewBody extends StatelessWidget {
  final LocationModel locationModel;
  const MapViewBody({Key? key, required this.locationModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = BlocProvider.of<LocationCubit>(context);
    var locating = false;
    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(locationModel.latitude, locationModel.longitude),
            zoom: 11.47,
          ),
          zoomControlsEnabled: false,
          minMaxZoomPreference: const MinMaxZoomPreference(1.5, 20.8),
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
          mapType: MapType.normal,
          onCameraMove: (position) {
            data.getCameraPosition(position);
          },
          onCameraIdle: () {
            data.onCameraIdle();
          },
        ),
        Center(
          child: Image.asset(
            'assets/images/marker.png',
            width: 40,
          ),
        ),
        BlocConsumer<LocationCubit, LocationState>(
          listener: (context, state) {
            // the most important thing i make that i begin to use BlocConsumer finally
            if (state is AddressLocationLoading) {
              locating = true;
            } else {
              locating = false;
            }
          },
          builder: (context, state) {
            return Positioned(
              bottom: 0.0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Column(
                  children: [
                    if (locating)
                      const LinearProgressIndicator(
                          color: primaryColor,
                          backgroundColor: greyColor,
                          minHeight: 3),
                    TextButton.icon(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/images/marker.png',
                        width: 22,
                      ),
                      label: Text(
                        locating ? 'Locating...' : data.getAdministrativeArea,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.title16,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Text(
                      data.getAddress,
                      style: Styles.title14.copyWith(color: greyColor2),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 15),
                    AbsorbPointer(
                      absorbing: locating ? true : false,
                      child: CExpandedButton(
                        text: 'Confirm Location',
                        bgColor: locating ? greyColor : primaryColor,
                        onPress: () async {
                          await data.confirmLocation(context);
                        },
                        textColor: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            );
          },
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../../core/constants.dart';
import '../../../../../../../core/utils/styles.dart';
import '../../../../../../welcome/presentation/model_views/location_cubit/location_cubit.dart';

class CLocationBox extends StatefulWidget {
  const CLocationBox({Key? key}) : super(key: key);

  @override
  State<CLocationBox> createState() => _CLocationBoxState();
}

class _CLocationBoxState extends State<CLocationBox> {
  String? address;
  String? adminstrativeArea;
  @override
  void initState() {
    final prefs = GetIt.I.get<SharedPreferences>();
    address = prefs.getString('address');
    adminstrativeArea = prefs.getString('administrativeArea');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final data = BlocProvider.of<LocationCubit>(context);
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/marker.png',
            width: 18,
          ),
          const SizedBox(width: 5),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () async {
                    await data.getCurrentDeviceLocation(context);
                  },
                  child: Row(
                    children: [
                      Text(
                        adminstrativeArea ?? 'press to set your location',
                        style: Styles.title15,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(width: 5),
                      const Icon(
                        Icons.edit_location_rounded,
                        size: 15,
                        color: black,
                      ),
                    ],
                  ),
                ),
                if (address != null)
                  Text(
                    address ?? '',
                    style: Styles.title13.copyWith(color: greyColor2),
                    overflow: TextOverflow.ellipsis,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

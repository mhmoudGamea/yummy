import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy/core/constants.dart';
import 'package:yummy/core/utils/cache_helper.dart';

import '../../../../../../../core/config/app_colors.dart';
import '../../../../../../../core/utils/styles.dart';
import '../../../../../../welcome/presentation/model_views/location_cubit/location_cubit.dart';

class CLocationBox extends StatefulWidget {
  const CLocationBox({super.key});

  @override
  State<CLocationBox> createState() => _CLocationBoxState();
}

class _CLocationBoxState extends State<CLocationBox> {
  String? address;
  String? adminstrativeArea;
  @override
  void initState() {
    super.initState();
    address = CacheHelper.getData(kAddress);
    adminstrativeArea = CacheHelper.getData(kAdministrativeArea);
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
                      Icon(
                        Icons.edit_location_rounded,
                        size: 15,
                        color: AppColors.black,
                      ),
                    ],
                  ),
                ),
                if (address != null)
                  Text(
                    address ?? '',
                    style: Styles.title13.copyWith(color: AppColors.greyColor2),
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

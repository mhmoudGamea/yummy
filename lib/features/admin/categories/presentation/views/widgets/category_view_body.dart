import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yummy/features/admin/categories/presentation/model_views/cubit/category_cubit.dart';

import '../../../../../../core/constants.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/c_circle_loading.dart';

class CategoryViewBody extends StatelessWidget {
  const CategoryViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var loading = false;
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(children: [
          BlocConsumer<CategoryCubit, CategoryState>(
            listener: (context, state) {
              // if (state is UploadImageLoading) {
              //   loading = true;
              // } else {
              //   loading = false;
              // }
            },
            builder: (context, state) {
              return Row(
                children: [
                  const Spacer(),
                  loading
                      ? const CCircleLoading()
                      : const Text(
                          'Add, delete, or update category',
                          style: Styles.title14,
                        ),
                  const Spacer(),
                  AbsorbPointer(
                    absorbing: loading ? true : false,
                    child: IconButton(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      constraints: const BoxConstraints(),
                      icon: const Icon(FontAwesomeIcons.plus,
                          size: 18, color: primaryColor),
                      onPressed: () {
                        // banner.pickBanner().then(
                        //       (_) => showDialog(
                        //         context: context,
                        //         builder: (context) {
                        //           return BlocProvider<BannerCubit>.value(
                        //             value: banner,
                        //             child: const BannerDialog(),
                        //           );
                        //         },
                        //       ),
                        //     );
                      },
                    ),
                  )
                ],
              );
            },
          ),
          const SizedBox(height: 10),
          const Divider(
            thickness: 3,
            color: primaryColor,
          ),
          const SizedBox(height: 10),
        ]));
  }
}

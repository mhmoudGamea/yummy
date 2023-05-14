import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:yummy/features/admin/categories/data/models/category_model.dart';
import 'package:yummy/features/admin/categories/presentation/model_views/cubit/category_cubit.dart';
import 'package:yummy/features/admin/categories/presentation/views/widgets/category_dialog.dart';
import 'package:yummy/features/admin/categories/presentation/views/widgets/category_grid_item.dart';

import '../../../../../../core/constants.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/c_circle_loading.dart';
import '../../../../../../core/widgets/c_error_widget.dart';

class CategoryViewBody extends StatelessWidget {
  const CategoryViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = BlocProvider.of<CategoryCubit>(context);
    FirebaseFirestore store = GetIt.I.get<FirebaseFirestore>();
    var loading = false;
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(children: [
          BlocConsumer<CategoryCubit, CategoryState>(
            listener: (context, state) {
              if (state is UploadImageLoading) {
                loading = true;
              } else {
                loading = false;
              }
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
                        showDialog(
                          context: context,
                          builder: (context) => BlocProvider.value(
                            value: category,
                            child: const CategoryDialog(),
                          ),
                        );
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
          StreamBuilder<QuerySnapshot>(
            stream: store.collection('categories').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CCircleLoading();
              } else if (snapshot.hasData) {
                List<CategoryModel> categories = [];
                for (var element in snapshot.data!.docs) {
                  categories.add(CategoryModel.fromJson(
                      element.data() as Map<String, dynamic>));
                }
                if (categories.isEmpty) {
                  return CErrorWidget(
                      text:
                          'Start to add a new category by click on add category button.',
                      icon: FontAwesomeIcons.faceSmile,
                      bgColor: primaryColor);
                }
                return Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 17 / 20),
                    itemCount: categories.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) =>
                        CategoryGridItem(model: categories[index]),
                  ),
                );
              }
              return CErrorWidget(
                  text: 'Sorry we have no Category for right now.',
                  icon: FontAwesomeIcons.xmark);
            },
          ),
        ]));
  }
}

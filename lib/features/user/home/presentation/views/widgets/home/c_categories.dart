import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:yummy/features/user/home/presentation/views/widgets/home/category_list_item.dart';

import '../../../../../../../core/config/app_colors.dart';
import '../../../../../../../core/widgets/c_circle_loading.dart';
import '../../../../../../../core/widgets/c_error_widget.dart';
import '../../../../../../admin/categories/data/models/category_model.dart';

class CCategories extends StatelessWidget {
  const CCategories({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore store = GetIt.I.get<FirebaseFirestore>();
    return StreamBuilder<QuerySnapshot>(
      stream: store.collection('categories').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CCircleLoading();
        } else if (snapshot.hasData) {
          List<CategoryModel> categories = [];
          for (var element in snapshot.data!.docs) {
            categories.add(
                CategoryModel.fromJson(element.data() as Map<String, dynamic>));
          }
          if (categories.isEmpty) {
            return CErrorWidget(
              text: 'No categories to display yet.',
              icon: FontAwesomeIcons.triangleExclamation,
              bgColor: AppColors.primaryColor,
            );
          }
          return SizedBox(
            height: 60,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(width: 25),
              itemBuilder: (context, index) =>
                  CategoryListItem(model: categories[index]),
              itemCount: categories.length,
            ),
          );
        }
        return const CErrorWidget(
            text: 'Sorry we have no Category for right now.',
            icon: FontAwesomeIcons.xmark);
      },
    );
  }
}

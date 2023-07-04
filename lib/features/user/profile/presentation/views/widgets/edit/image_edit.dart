import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yummy/core/utils/styles.dart';
import 'package:yummy/features/user/profile/presentation/model-views/profile_cubit/profile_cubit.dart';

import '../../../../../../../core/constants.dart';

class ImageEdit extends StatelessWidget {
  const ImageEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size.height;
    final data = BlocProvider.of<ProfileCubit>(context);
    return GestureDetector(
      onTap: () => data.pickProfileImage(),
      child: BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
        if (state is PickProfileImage) {
          return ProfileSelectedImage(media: media, data: data);
        }
        return SelectImage(media: media);
      }),
    );
  }
}

// this when user doesn't select his profile image yet
class SelectImage extends StatelessWidget {
  const SelectImage({
    super.key,
    required this.media,
  });

  final double media;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: media * 0.2,
      width: media * 0.2,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.white,
      ),
      child: DottedBorder(
        borderType: BorderType.Circle,
        color: greyColor,
        borderPadding: const EdgeInsets.all(8),
        child: SizedBox(
          height: media * 0.2,
          width: media * 0.2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                FontAwesomeIcons.image,
                color: greyColor.withOpacity(0.5),
                size: 50,
              ),
              const SizedBox(height: 8),
              const Text(
                'Select Image',
                style: Styles.title13,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// this if user select his profile image
class ProfileSelectedImage extends StatelessWidget {
  const ProfileSelectedImage({
    super.key,
    required this.media,
    required this.data,
  });

  final double media;
  final ProfileCubit data;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: media * 0.2,
      width: media * 0.2,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.white,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.file(
          data.getProfileImage!,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

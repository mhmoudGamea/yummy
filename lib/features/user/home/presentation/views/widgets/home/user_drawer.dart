import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../chat/presentation/views/chat_contacts_view.dart';
import '../../../model_views/drawer_cubit.dart/drawer_cubit.dart';
import 'user_drawer_data.dart';
import 'user_drawer_item.dart';

class UserDrawer extends StatelessWidget {
  const UserDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final drawerCubit = BlocProvider.of<DrawerCubit>(context);
    return Drawer(
        width: MediaQuery.of(context).size.width * 0.6,
        backgroundColor: Colors.white,
        child: SafeArea(
          child: Column(
            children: [
              UserDrawerData(),
              UserDrawerItem(
                title: 'Bell',
                icon: FontAwesomeIcons.bell,
                onTapped: () {},
              ),
              UserDrawerItem(
                title: 'Chat',
                icon: FontAwesomeIcons.commentDots,
                onTapped: () {
                  GoRouter.of(context).push(ChatContactsView.rn);
                },
              ),
              Spacer(),
              UserDrawerItem(
                  title: 'Logout',
                  icon: FontAwesomeIcons.arrowRightFromBracket,
                  onTapped: () {
                    drawerCubit.logOut(context);
                  }),
            ],
          ),
        ));
  }
}

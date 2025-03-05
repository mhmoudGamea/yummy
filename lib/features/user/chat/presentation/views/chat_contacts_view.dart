import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy/features/user/chat/presentation/model_views/chat_cubit/chat_cubit.dart';

import '../../../../../core/utils/helper.dart';
import '../../domain/repos/chat_repo/chat_repo_impl.dart';
import 'widgets/chat_contacts_view_body.dart';

class ChatContactsView extends StatelessWidget {
  static const rn = '/chat-contacts';
  const ChatContactsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(ChatRepoImpl())..getContacts(),
      child: Scaffold(
        appBar: Helper.appBar(
          context: context,
          text: 'Contacts',
          bgColor: Colors.white,
          textColor: Colors.black,
          elevation: 2,
          iconColor: Colors.black,
        ),
        body: SafeArea(child: ChatContactsViewBody()),
      ),
    );
  }
}

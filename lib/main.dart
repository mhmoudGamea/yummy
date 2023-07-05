import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// firebase packages
import 'package:firebase_core/firebase_core.dart';
import 'package:yummy/core/utils/cache_helper.dart';
import 'firebase_options.dart';

// app packages
import './core/constants.dart';
import './core/utils/app_routes.dart';
import './core/utils/service_locator.dart';
import './features/welcome/data/repos/location/location_repo_impl.dart';
import './features/welcome/presentation/model_views/location_cubit/location_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await ServiceLocator.setUp();
  AppRoutes.getAuthState();
  uid = CacheHelper.getData('uid');
  userPhone = CacheHelper.getData('userPhone');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print('************************************');
    print(uid);
    print(userPhone);
    print('************************************');
    return BlocProvider(
      create: (context) => LocationCubit(LocationRepoImpl()),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Food App',
        theme: lightTheme,
        routerConfig: AppRoutes.getRouter,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// firebase packages
import 'package:firebase_core/firebase_core.dart';
import 'package:yummy/core/utils/api_services.dart';
import 'package:yummy/features/user/home/presentation/model_views/order_cubit/order_cubit.dart';
import 'features/user/home/presentation/model_views/cart_cubit/cart_cubit.dart';
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
  ApiServices.initializeDio();
  AppRoutes.getAuthState();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocationCubit(LocationRepoImpl()),
        ),
        BlocProvider(
          create: (context) => OrderCubit()..calculateTotalPrice(),
        ),
        BlocProvider(create: (context) => CartCubit()..getCartItems()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Food App',
        theme: lightTheme,
        routerConfig: AppRoutes.getRouter,
      ),
    );
  }
}

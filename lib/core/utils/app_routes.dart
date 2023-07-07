import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy/features/admin/users_faqs/presentation/views/user_faqs_view.dart';

// views imports
import '../../features/admin/admin_home/presentation/views/admin_home_view.dart';
import '../../features/admin/banners/presentation/views/banner_manage_view.dart';
import '../../features/admin/categories/presentation/views/category_view.dart';
import '../../features/admin/food/presentation/views/food_view.dart';
import '../../features/admin/login/presentation/views/admin_login_view.dart';
import '../../features/admin/register/presentation/views/admin_register_view.dart';
import '../../features/on_board/presentation/views/board_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';
import '../../features/user/home/data/data/user_food_model.dart';
import '../../features/user/home/presentation/views/food_details_view.dart';
import '../../features/user/home/presentation/views/home_view.dart';
import '../../features/user/profile/presentation/views/user_edit_profile_view.dart';
import '../../features/user/register/login/presentation/login_view.dart';
import '../../features/welcome/data/models/location_model.dart';
import '../../features/welcome/presentation/views/map_view.dart';
import '../../features/welcome/presentation/views/welcome_view.dart';
import '../widgets/tabs_view.dart';

class AppRoutes {
  static late String path;

  static void getAuthState() {
    GetIt.I.get<FirebaseAuth>().authStateChanges().listen(
      (event) {
        if (event == null) {
          path = '/';
        } else if (event.email == 'admin@gmail.com') {
          path = AdminHomeView.rn;
        } else {
          path = TabsView.rn;
        }
      },
    );
  }

  static GoRouter get getRouter {
    return _router;
  }

  static final _router = GoRouter(
    initialLocation: path,
    routes: [
      GoRoute(
        path: SplashView.rn,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: LoginView.rn,
        builder: (context, state) => LoginView(
          locationModel: state.extra as LocationModel,
        ),
      ),
      GoRoute(
        path: BoardView.rn,
        builder: (context, state) => const BoardView(),
      ),
      GoRoute(
        path: WelcomeView.rn,
        builder: (context, state) => const WelcomeView(),
      ),
      GoRoute(
        path: MapView.rn,
        builder: (context, state) => MapView(
          locationModel: state.extra as LocationModel,
        ),
      ),
      GoRoute(
        path: HomeView.rn,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: FoodDetailsView.rn,
        builder: (context, state) =>
            FoodDetailsView(model: state.extra as UserFoodModel),
      ),
      GoRoute(
        path: TabsView.rn,
        builder: (context, state) => const TabsView(),
      ),
      GoRoute(
        path: UserEditProfileView.rn,
        builder: (context, state) => const UserEditProfileView(),
      ),

      // admin navigation section
      GoRoute(
        path: AdminLoginView.rn,
        builder: (context, state) => const AdminLoginView(),
      ),
      GoRoute(
        path: AdminRegisterView.rn,
        builder: (context, state) => const AdminRegisterView(),
      ),
      GoRoute(
        path: AdminHomeView.rn,
        builder: (context, state) => const AdminHomeView(),
      ),
      GoRoute(
        path: BannerManageView.rn,
        builder: (context, state) => const BannerManageView(),
      ),
      GoRoute(
        path: CategoryView.rn,
        builder: (context, state) => const CategoryView(),
      ),
      GoRoute(
        path: FoodView.rn,
        builder: (context, state) => const FoodView(),
      ),
      GoRoute(
        path: UserFaqsView.rn,
        builder: (context, state) => const UserFaqsView(),
      ),
    ],
  );
}

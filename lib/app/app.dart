import 'package:movie_app/service/api_service.dart';
import 'package:movie_app/ui/views/home/home_view.dart';
import 'package:movie_app/ui/views/log%20in/login_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView, initial: true),
    MaterialRoute(page: LoginView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: Api),
  ],
)
class AppSetup {}

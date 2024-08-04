import 'package:kiwi/kiwi.dart';

import 'features/auth/welcome/views/view_model/controller.dart';
import 'features/nav_bar_view/presentation/view_model/bloc/bloc.dart';
import 'features/splash_view/presentation/view_models/controller.dart';

void initKiwi() {
  KiwiContainer container = KiwiContainer();

  container.registerFactory((c) => SplashController());
  container.registerFactory((c) => LanguageCubit());
  container.registerFactory((c) => NavigationBloc());
}

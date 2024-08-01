import 'package:kiwi/kiwi.dart';

import 'features/splash_view/presentation/view_models/controller.dart';

void initKiwi() {
  KiwiContainer container = KiwiContainer();

  container.registerFactory((c) => SplashController());
}

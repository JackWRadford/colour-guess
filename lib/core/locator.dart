import 'package:colour_guess/core/services/shared_pref_service.dart';
import 'package:colour_guess/core/viewModels/game_view_model.dart';
import 'package:get_it/get_it.dart';

///get it instance
GetIt locator = GetIt.instance;

///initialize locator
void initLocator() {
  //services
  locator.registerLazySingleton(() => SharedPrefService());

  //view models
  locator.registerFactory(() => GameModel());
}

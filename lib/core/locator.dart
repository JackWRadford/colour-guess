import 'package:colour_guess/core/viewModels/game_view_model.dart';
import 'package:get_it/get_it.dart';

///get it instance
GetIt locator = GetIt.instance;

///initialize locator
void initLocator() {
  //services

  //view models
  locator.registerFactory(() => GameModel());
}

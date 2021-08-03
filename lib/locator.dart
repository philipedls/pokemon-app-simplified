import 'package:get_it/get_it.dart';
import 'package:pokemon_app/presentation/pages/detail/detail_store.dart';
import 'package:pokemon_app/presentation/pages/home/home_store.dart';

class Locator {
  static void onLocator() {
    GetIt.I.registerLazySingleton<HomeStore>(() => HomeStore());
    GetIt.I.registerLazySingleton<DetailStore>(() => DetailStore());
  }
}

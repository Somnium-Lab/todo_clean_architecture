import 'package:get_it/get_it.dart';

import 'app/navigation-service.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  //navigation
  serviceLocator.registerLazySingleton(() => NavigationService());
}

Future<void> reset() async {}

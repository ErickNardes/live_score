import 'package:flutter_modular/flutter_modular.dart';

import 'core/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  List<ModularRoute> get routes => [ModuleRoute(Modular.initialRoute, module: HomeModule())];
}

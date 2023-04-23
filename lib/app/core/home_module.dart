import 'package:flutter_modular/flutter_modular.dart';

import '../features/base_app/base_app.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const BaseApp()),
  ];
}

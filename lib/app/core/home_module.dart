import 'package:flutter_modular/flutter_modular.dart';

import '../features/base_app/base_app.dart';
import '../features/home_page/controler/home_controller.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => HomeController(
        leagueStore: i(),
        tableCampStore: i(),
        matchStore: i(),
        detailsMatchLiveStore: i())),
  ];

  @override
  List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const BaseApp()),
  ];
}

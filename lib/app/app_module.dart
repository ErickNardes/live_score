import 'package:flutter_modular/flutter_modular.dart';
import 'package:live_score/app/features/table_camp/domain/usecase/get_table_camp_usecase.dart';
import 'package:live_score/app/features/table_camp/external/datasource/get_table_camp_datasource.dart';
import 'package:live_score/app/features/table_camp/infra/get_table_camp_repository.dart';
import 'package:live_score/app/features/table_camp/presenter/store/table_camp_store.dart';

import 'core/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => GetTableCampDatasource()),
    Bind((i) => GetTableCampRepository(i())),
    Bind((i) => GetTableCampUsecase(i())),
    Bind((i) => TableCampStore(i())),
  ];

  @override
  List<ModularRoute> get routes =>
      [ModuleRoute(Modular.initialRoute, module: HomeModule())];
}

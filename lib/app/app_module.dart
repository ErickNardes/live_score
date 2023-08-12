import 'package:flutter_modular/flutter_modular.dart';
import 'package:live_score/app/features/home_page/controler/home_controller.dart';
import 'package:live_score/app/features/leagues/domain/usecase/get_leagues_usecase.dart';
import 'package:live_score/app/features/leagues/external/datasource/get_league_datasource.dart';
import 'package:live_score/app/features/leagues/infra/repository/get_leagues_repository.dart';
import 'package:live_score/app/features/leagues/presenter/store/league_store.dart';
import 'package:live_score/app/features/matchs_league/domain/entities/usecase/get_match_of_league_usecase.dart';
import 'package:live_score/app/features/matchs_league/external/datasource/get_match_of_league_datasource.dart';
import 'package:live_score/app/features/matchs_league/infra/repository/get_match_of_league_repository.dart';
import 'package:live_score/app/features/matchs_league/presenter/store/match_store.dart';
import 'package:live_score/app/features/table_camp/domain/usecase/get_table_camp_usecase.dart';
import 'package:live_score/app/features/table_camp/external/datasource/get_table_camp_datasource.dart';
import 'package:live_score/app/features/table_camp/infra/get_table_camp_repository.dart';
import 'package:live_score/app/features/table_camp/presenter/store/table_camp_store.dart';

import 'core/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    //getMatch
    Bind.lazySingleton((i) => GetMatchOfLeagueUsecase(i())),
    Bind.lazySingleton((i) => GetMatchOfLeagueRepository(i())),
    Bind.lazySingleton((i) => GetMatchOfLeagueDatasource()),
    Bind((i) => MatchStore(i())),
    //getLeagues
    Bind.singleton((i) => GetLeaguesUsecase(i())),
    Bind.singleton((i) => GetLeagueRepository(i())),
    Bind.singleton((i) => GetLeagueDatasource()),

    Bind((i) => LeagueStore(i())),

    //getTableLeagues
    Bind((i) => GetTableCampDatasource()),
    Bind((i) => GetTableCampRepository(i())),
    Bind((i) => GetTableCampUsecase(i())),
    Bind((i) => TableCampStore(i())),
    Bind((i) =>
        HomeController(leagueStore: i(), tableCampStore: i(), matchStore: i())),
  ];

  @override
  List<ModularRoute> get routes =>
      [ModuleRoute(Modular.initialRoute, module: HomeModule())];
}

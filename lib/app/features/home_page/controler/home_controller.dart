import 'package:live_score/app/features/leagues/presenter/store/league_store.dart';
import 'package:live_score/app/features/table_camp/domain/params/get_table_camp_params.dart';
import 'package:live_score/app/features/table_camp/presenter/store/table_camp_store.dart';

import '../../matchs_league/presenter/store/match_store.dart';

class HomeController {
  final LeagueStore leagueStore;
  final TableCampStore tableCampStore;
  final MatchStore matchStore;
  HomeController({
    required this.leagueStore,
    required this.tableCampStore,
    required this.matchStore,
  });

  Future<void> getTableCamp(int id) async {
    await tableCampStore.getTableCamp(GetTableCampParams(idCamp: id));
  }
}

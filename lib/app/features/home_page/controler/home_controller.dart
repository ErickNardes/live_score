// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:live_score/app/features/leagues/presenter/store/league_store.dart';
import 'package:live_score/app/features/matchs_league/presenter/store/match_store.dart';
import 'package:live_score/app/features/table_camp/presenter/store/table_camp_store.dart';

class HomeController {
  final LeagueStore leagueStore;
  final TableCampStore tableCampStore;
  final MatchStore matchStore;
  HomeController({
    required this.leagueStore,
    required this.tableCampStore,
    required this.matchStore,
  });

  Future<void> getTableCamp() async {}
}

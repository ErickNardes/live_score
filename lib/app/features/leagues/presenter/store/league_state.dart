// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:live_score/app/features/leagues/domain/entities/leagues_entity.dart';

class LeagueState {
  final Map<String, List<LeagueEntity>> leaguesByCountry;
  final List<LeagueEntity> listLeague;
  final int leagueSelected;
  LeagueState({
    required this.leaguesByCountry,
    required this.listLeague,
    required this.leagueSelected,
  });

  factory LeagueState.init() => LeagueState(
        listLeague: [],
        leagueSelected: 2013,
        leaguesByCountry: {},
      );
  LeagueState copiWith({
    Map<String, List<LeagueEntity>>? leaguesByCountry,
    int? leagueSelected,
    List<LeagueEntity>? listLeague,
  }) {
    return LeagueState(
        listLeague: listLeague ?? this.listLeague,
        leagueSelected: leagueSelected ?? this.leagueSelected,
        leaguesByCountry: leaguesByCountry ?? this.leaguesByCountry);
  }
}

import 'package:live_score/app/features/leagues/domain/entities/leagues_entity.dart';

class LeagueState {
  final List<LeagueEntity> listLeague;
  final int leagueSelected;
  LeagueState({
    required this.listLeague,
    required this.leagueSelected,
  });

  factory LeagueState.init() => LeagueState(
        listLeague: [],
        leagueSelected: 2013,
      );
  LeagueState copiWith({
    int? leagueSelected,
    List<LeagueEntity>? listLeague,
  }) {
    return LeagueState(
        listLeague: listLeague ?? this.listLeague,
        leagueSelected: leagueSelected ?? this.leagueSelected);
  }
}

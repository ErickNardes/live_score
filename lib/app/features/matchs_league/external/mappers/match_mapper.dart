import 'package:live_score/app/features/matchs_league/domain/entities/macthe_entity.dart';

class MatchMapper {
  static MatchEntity fromMap(Map<String, dynamic> map) {
    final homeTeam = map['homeTeam'];
    final awayTeam = map['awayTeam'];
    final score = map['score'];
    final competition = map['competition'];

    final fullTime = score['fullTime'];

    return MatchEntity(
      id: map['id'],
      status: map['status'],
      matchDay: map['matchday'] ?? 0,
      stage: map['stage'],
      utcDate: map['utcDate'],
      idHomeTeam: homeTeam['id'] ?? 0,
      nameHomeTeam: homeTeam['name'] ?? '',
      shortNameHomeTeam: homeTeam['shortName'] ?? '',
      tlaHomeTeam: homeTeam['tla'] ?? '',
      crestHomeTeam: homeTeam['crest'] ?? '',
      idAwayTeam: awayTeam['id'] ?? 0,
      nameAwayTeam: awayTeam['name'] ?? '',
      shortNameAwayTeam: awayTeam['shortName'] ?? '',
      tlaAwayTeam: awayTeam['tla'] ?? '',
      crestAwayTeam: awayTeam['crest'] ?? '',
      winner: score['winner'] ?? '',
      scoreHome: fullTime['home'] ?? 0,
      scoreAway: fullTime['away'] ?? 0,
      emblemCompetition: competition['emblem'],
      nameCompetition: competition['name'],
    );
  }
}

import 'package:live_score/app/features/matchs_live/domain/entities/macthe_entity.dart';

class MatchMapper {
  static MatchLiveEntity fromMap(Map<String, dynamic> map) {
    final fixture = map['fixture'];
    final vanue = fixture['venue'];
    final status = fixture['status'];
    final league = map['league'];
    final teams = map['teams'];
    final goals = map['goals'];
    final homeTeam = teams['home'];
    final awayTeam = teams['away'];
    return MatchLiveEntity(
        idFixture: fixture['id'],
        dateMatch: fixture['date'],
        idVanue: vanue['id'] ?? 0,
        nameVanue: vanue['name'] ?? '',
        cityVanue: vanue['city'] ?? '',
        stattusLong: status['long'],
        statusElapsed: status['elapsed'] ?? 0,
        idLeague: league['id'],
        nameLeague: league['name'],
        logoLeague: league['logo'],
        flagLeague: league['flag'] ?? '',
        season: league['season'],
        idHomeTeam: homeTeam['id'],
        nameHomeTeam: homeTeam['name'],
        logoHomeTeam: homeTeam['logo'],
        idAwayTeam: awayTeam['id'],
        nameAwayTeam: awayTeam['name'],
        logoAwayTeam: awayTeam['logo'],
        goalHome: goals['home'],
        goalAway: goals['away'],
        countryLeague: league['country'],
        statusShort: status['short']);
  }
}

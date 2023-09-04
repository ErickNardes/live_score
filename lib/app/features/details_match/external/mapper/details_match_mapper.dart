import 'package:live_score/app/features/details_match/domain/entities/details_match_entity.dart';

class DetailsMatchMapper {
  static List<DetailsMatchEntity> fromMapList(List<dynamic> list) {
    return list.map((map) => fromMap(map)).toList();
  }

  static DetailsMatchEntity fromMap(Map<String, dynamic> map) {
    final team = map['team'];
    final statistics = map['statistics'];

    return DetailsMatchEntity(
      id: team['id'],
      nameTeam: team['name'],
      logoTeam: team['logo'],
      shotsOnGoal: _getStatisticValue(statistics, "Shots on Goal") ?? 0,
      shotsOffGoal: _getStatisticValue(statistics, "Shots off Goal") ?? 0,
      totalShotsGoal: _getStatisticValue(statistics, "Total Shots") ?? 0,
      blockedShots: _getStatisticValue(statistics, "Blocked Shots") ?? 0,
      shotsInsideBox: _getStatisticValue(statistics, "Shots insidebox") ?? 0,
      shotsOutsideBox: _getStatisticValue(statistics, "Shots outsidebox") ?? 0,
      fouls: _getStatisticValue(statistics, "Fouls") ?? 0,
      connerKicks: _getStatisticValue(statistics, "Corner Kicks") ?? 0,
      offsides: _getStatisticValue(statistics, "Offsides") ?? 0,
      possession: _getStatisticValue(statistics, "Ball Possession") ?? 0,
      yellowCards: _getStatisticValue(statistics, "Yellow Cards") ?? 0,
      redCards: _getStatisticValue(statistics, "Red Cards") ?? 0,
      totalPasses: _getStatisticValue(statistics, "Total passes") ?? 0,
      passesAccurate: _getStatisticValue(statistics, "Passes accurate") ?? 0,
    );
  }

  static dynamic _getStatisticValue(List<dynamic> statistics, String type) {
    final stat = statistics.firstWhere((stat) => stat['type'] == type,
        orElse: () => null);
    return stat != null ? stat['value'] : null;
  }
}

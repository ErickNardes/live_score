import 'package:live_score/app/features/table_camp/domain/table_camp_entity.dart';

class GetTableCampMappers {
  static List<TableCampEntity> fromMapList(List<dynamic> list) {
    final List<TableCampEntity> tableEntities = [];

    for (var standingsList in list) {
      final standings = standingsList['league']['standings']
          [0]; // Acessar a lista de standings
      final league = standingsList['league'];

      for (var standingsEntry in standings) {
        final all = standingsEntry['all'];
        final team = standingsEntry['team'];
        final goals = all['goals'];

        final tableCampEntity = TableCampEntity(
          rank: standingsEntry['rank'],
          idTeam: team['id'],
          nameTeam: team['name'],
          logoTeam: team['logo'],
          points: standingsEntry['points'],
          goalsDiff: standingsEntry['goalsDiff'],
          played: all['played'],
          win: all['win'],
          draw: all['draw'],
          lose: all['lose'],
          goalFor: goals['for'],
          goalAgainst: goals['against'],
          country: league['country'],
          logo: league['logo'],
          id: league['id'],
        );

        tableEntities.add(tableCampEntity);
      }
    }

    return tableEntities;
  }
}

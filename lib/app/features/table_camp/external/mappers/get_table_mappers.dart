import 'package:live_score/app/features/table_camp/domain/table_camp_entity.dart';

import '../../../club/domain/club_entity.dart';

class GetTableCampMappers {
  static List<TableCampEntity> fromMap(Map<String, dynamic> map) {
    final table = map['table'];
    final List<TableCampEntity> tableEntities = [];

    for (var teamEntry in table) {
      final team = teamEntry['team'];

      final club = ClubEntity(
        id: team['id'],
        name: team['shortName'],
        crestImage: team['crest'],
        points: teamEntry['points'],
        goalDifference: teamEntry['goalDifference'],
        playedGames: teamEntry['playedGames'],
      );

      final tableCampEntity = TableCampEntity(
        score: teamEntry['points'],
        listClub: club,
        positionClub: teamEntry['position'],
      );

      tableEntities.add(tableCampEntity);
    }

    return tableEntities;
  }
}

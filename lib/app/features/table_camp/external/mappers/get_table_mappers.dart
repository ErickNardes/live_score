import 'package:live_score/app/features/table_camp/domain/table_camp_entity.dart';

import '../../../club/domain/club_entity.dart';

class GetTableCampMappers {
  static TableCampEntity fromMap(Map<String, dynamic> map) {
    final time = map['time'];

    final club = ClubEntity(
      id: time['time_id'],
      name: time['nome_popular'],
      sigla: time['sigla'],
      image: time['escudo'],
    );
    return TableCampEntity(
      position: map['posicao'],
      score: map['pontos'],
      listClub: club,
    );
  }
}

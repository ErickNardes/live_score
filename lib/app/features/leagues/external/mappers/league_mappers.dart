import 'package:live_score/app/features/leagues/domain/entities/leagues_entity.dart';

class LeaguesMapper {
  static LeagueEntity fromMap(Map<String, dynamic> map) {
    final country = map['country'];
    final seasons = map['seasons'];
    final coverage = seasons[0]['coverage'];
    final league = map['league'];
    return LeagueEntity(
        id: league['id'],
        name: league['name'],
        logo: country['flag'] ?? '',
        emblem: league['logo'],
        selected: false,
        code: country['code'] ?? '',
        cuntry: country['country'] ?? '',
        flag: country['flag'] ?? '',
        type: league['type'],
        odds: coverage['odds']);
  }
}

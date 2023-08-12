import 'package:live_score/app/features/leagues/domain/entities/leagues_entity.dart';

class LeaguesMapper {
  static LeagueEntity fromMap(Map<String, dynamic> map) {
    final area = map['area'];
    return LeagueEntity(
      id: map['id'],
      name: map['name'],
      logo: area['flag'] ?? '',
      emblem: map['emblem'],
      selected: false,
    );
  }
}

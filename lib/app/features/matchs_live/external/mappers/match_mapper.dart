import 'package:live_score/app/features/club/domain/club_entity.dart';
import 'package:live_score/app/features/matchs_live/domain/entities/macthe_entity.dart';

class MatchMapper {
  static ClubEntity fromMap(Map<String, dynamic> map) {
    return ClubEntity(id: map['id'], name: map['name'], logo: map['logo']);
  }
}

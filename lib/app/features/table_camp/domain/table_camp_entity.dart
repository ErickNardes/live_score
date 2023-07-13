import '../../club/domain/club_entity.dart';

class TableCampEntity {
  final int position;
  final int score;
  final ClubEntity listClub;
  TableCampEntity({
    required this.position,
    required this.score,
    required this.listClub,
  });
}

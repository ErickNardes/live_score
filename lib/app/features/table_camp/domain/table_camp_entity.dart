// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../club/domain/club_entity.dart';

class TableCampEntity {
  final int positionClub;
  final int score;
  final ClubEntity listClub;
  TableCampEntity({
    required this.positionClub,
    required this.score,
    required this.listClub,
  });
}

class TableCampEntity {
  final int id;
  final int rank;
  final int idTeam;
  final String nameTeam;
  final String logoTeam;
  final int points;
  final int goalsDiff;
  final int played;
  final int win;
  final int draw;
  final int lose;
  final int goalFor;
  final int goalAgainst;
  final String country;
  final String logo;

  TableCampEntity({
    required this.id,
    required this.rank,
    required this.idTeam,
    required this.nameTeam,
    required this.logoTeam,
    required this.points,
    required this.goalsDiff,
    required this.played,
    required this.win,
    required this.draw,
    required this.lose,
    required this.goalFor,
    required this.goalAgainst,
    required this.country,
    required this.logo,
  });
}

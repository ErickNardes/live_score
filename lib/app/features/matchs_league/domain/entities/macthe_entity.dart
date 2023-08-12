class MatchEntity {
  final int id;
  final String status;
  final int matchDay;
  final String nameCompetition;
  final String emblemCompetition;
  final String stage;
  final String utcDate;
  final int idHomeTeam;
  final String nameHomeTeam;
  final String shortNameHomeTeam;
  final String tlaHomeTeam;
  final String crestHomeTeam;
  final int idAwayTeam;
  final String nameAwayTeam;
  final String shortNameAwayTeam;
  final String tlaAwayTeam;
  final String crestAwayTeam;
  final String winner;
  final int scoreHome;
  final int scoreAway;
  MatchEntity({
    required this.id,
    required this.status,
    required this.matchDay,
    required this.nameCompetition,
    required this.emblemCompetition,
    required this.stage,
    required this.utcDate,
    required this.idHomeTeam,
    required this.nameHomeTeam,
    required this.shortNameHomeTeam,
    required this.tlaHomeTeam,
    required this.crestHomeTeam,
    required this.idAwayTeam,
    required this.nameAwayTeam,
    required this.shortNameAwayTeam,
    required this.tlaAwayTeam,
    required this.crestAwayTeam,
    required this.winner,
    required this.scoreHome,
    required this.scoreAway,
  });
}

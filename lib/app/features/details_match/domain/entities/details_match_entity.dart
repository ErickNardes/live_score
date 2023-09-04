class DetailsMatchEntity {
  final int id;
  final String nameTeam;
  final String logoTeam;
  final int shotsOnGoal;
  final int shotsOffGoal;
  final int totalShotsGoal;
  final int blockedShots;
  final int shotsInsideBox;
  final int shotsOutsideBox;
  final int fouls;
  final int connerKicks;
  final int offsides;
  final String possession;
  final int yellowCards;
  final int redCards;
  final int totalPasses;
  final int passesAccurate;
  DetailsMatchEntity({
    required this.id,
    required this.nameTeam,
    required this.logoTeam,
    required this.shotsOnGoal,
    required this.shotsOffGoal,
    required this.totalShotsGoal,
    required this.blockedShots,
    required this.shotsInsideBox,
    required this.shotsOutsideBox,
    required this.fouls,
    required this.connerKicks,
    required this.offsides,
    required this.possession,
    required this.yellowCards,
    required this.redCards,
    required this.totalPasses,
    required this.passesAccurate,
  });
}

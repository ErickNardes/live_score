class MatchLiveEntity {
  final int idFixture;
  final String dateMatch;
  final int idVanue;
  final String nameVanue;
  final String cityVanue;
  final String statusShort;
  final String stattusLong;
  final int statusElapsed;
  final int idLeague;
  final String nameLeague;
  final String logoLeague;
  final String flagLeague;
  final String countryLeague;
  final int season;
  final int idHomeTeam;
  final String nameHomeTeam;
  final String logoHomeTeam;
  final int idAwayTeam;
  final String nameAwayTeam;
  final String logoAwayTeam;
  final int goalHome;
  final int goalAway;
  MatchLiveEntity({
    required this.idFixture,
    required this.dateMatch,
    required this.idVanue,
    required this.nameVanue,
    required this.cityVanue,
    required this.statusShort,
    required this.stattusLong,
    required this.statusElapsed,
    required this.idLeague,
    required this.nameLeague,
    required this.logoLeague,
    required this.flagLeague,
    required this.countryLeague,
    required this.season,
    required this.idHomeTeam,
    required this.nameHomeTeam,
    required this.logoHomeTeam,
    required this.idAwayTeam,
    required this.nameAwayTeam,
    required this.logoAwayTeam,
    required this.goalHome,
    required this.goalAway,
  });
}

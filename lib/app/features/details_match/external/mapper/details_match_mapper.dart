import 'package:live_score/app/features/details_match/domain/entities/details_match_entity.dart';

class DetailsMatchMapper {
  static DetailsMatchEntity fromMap(Map<String, dynamic> map) {
    final competition = map['competition'];
    final homeTeam = map['homeTeam'];
    final coachHomeTeam = homeTeam['coach'];
    final lineUpHome = homeTeam['lineup'];
    final statisticHome = homeTeam['statistics'];
    final awayTeam = map['awayTeam'];
    final coachAwayTeam = awayTeam['coach'];
    final lineUpAway = awayTeam['lineup'];
    final statisticsAway = awayTeam['statistics'];

    return DetailsMatchEntity(
        idMatch: map['id'],
        utcDate: map['utcDate'],
        status: map['status'],
        minute: map['minute'],
        injuryTime: map['injuryTime'],
        vanue: map['vanue'],
        matchDay: map['matchDay'],
        idHomeTeam: homeTeam['id'],
        shortHomeTeam: homeTeam['shortName'],
        homeTla: homeTeam['tla'],
        homeTeamCresp: homeTeam['crest'],
        coachHomeTeam: coachHomeTeam['id'],
        coachNameHomeTeam: coachHomeTeam['name'],
        homeFormattion: homeTeam['formation'],
        idPlayerHome: lineUpHome['id'],
        namePlayerHome: lineUpHome['name'],
        positionPlayrHome: lineUpHome['position'],
        numberPlayerHome: lineUpHome['shirtNumber'],
        connerHome: statisticHome['coner_kicks'],
        freeKicksHome: statisticHome['free_kicks'],
        goalKicksHome: statisticHome['goal_kicks'],
        offsidesHome: statisticHome['offsides'],
        foulsHome: statisticHome['fouls'],
        ballPossessionHome: statisticHome['ball_possession'],
        shotshome: statisticHome['shots'],
        shotOnGoalHome: statisticHome['shots_on_goal'],
        shotOffGoalHome: statisticHome['shots_off_goal'],
        yellowCardHome: statisticHome['yellow_cards'],
        redCardHome: statisticHome['red_cards'],
        idWayTeam: awayTeam['id'],
        shortWayTeam: awayTeam['shortName'],
        wayTla: awayTeam['tla'],
        wayTeamCresp: awayTeam['crest'],
        coachWayTeam: coachAwayTeam['id'],
        coachNameWayTeam: coachAwayTeam['name'],
        wayFormattion: awayTeam['formation'],
        idPlayerWay: lineUpAway['id'],
        namePlayerWay: lineUpAway['name'],
        positionPlayrWay: lineUpAway['position'],
        numberPlayerWay: lineUpAway['shirtNumber'],
        connerWay: statisticsAway['corner_kicks'],
        freeKicksWay: statisticsAway['free_kicks'],
        goalKicksWay: statisticsAway['goal_kicks'],
        offsidesWay: statisticsAway['offsides'],
        foulsWay: statisticsAway['fouls'],
        ballPossessionWay: statisticsAway['ball_possession'],
        shotsWay: statisticsAway['shots'],
        shotOnGoalWay: statisticsAway['shots_on_goal'],
        shotOffGoalWay: statisticsAway['shots_off_goal'],
        yellowCardWay: statisticsAway['yellow_cards'],
        redCardWay: statisticsAway['red_cards']);
  }
}

import 'package:live_score/app/features/matchs_league/domain/entities/macthe_entity.dart';

class MatchState {
  final List<MatchEntity> matchFutureList;
  final List<MatchEntity> matchLiveList;
  MatchState({
    required this.matchFutureList,
    required this.matchLiveList,
  });

  factory MatchState.init() => MatchState(
        matchFutureList: [],
        matchLiveList: [],
      );
  MatchState copyWith({
    List<MatchEntity>? matchLiveList,
    List<MatchEntity>? matchFutureList,
  }) {
    return MatchState(
      matchFutureList: matchFutureList ?? this.matchFutureList,
      matchLiveList: matchLiveList ?? this.matchLiveList,
    );
  }
}

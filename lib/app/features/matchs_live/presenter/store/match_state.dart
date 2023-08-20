import 'package:live_score/app/features/matchs_live/domain/entities/macthe_entity.dart';

class MatchState {
  final List<MatchLiveEntity> matchFutureList;
  final List<MatchLiveEntity> matchLiveList;
  MatchState({
    required this.matchFutureList,
    required this.matchLiveList,
  });

  factory MatchState.init() => MatchState(
        matchFutureList: [],
        matchLiveList: [],
      );
  MatchState copyWith({
    List<MatchLiveEntity>? matchLiveList,
    List<MatchLiveEntity>? matchFutureList,
  }) {
    return MatchState(
      matchFutureList: matchFutureList ?? this.matchFutureList,
      matchLiveList: matchLiveList ?? this.matchLiveList,
    );
  }
}

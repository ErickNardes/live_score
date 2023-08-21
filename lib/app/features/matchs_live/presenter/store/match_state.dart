import 'package:live_score/app/features/matchs_live/domain/entities/macthe_entity.dart';

class MatchState {
  final Map<String, List<MatchLiveEntity>> matchForCountry;
  final List<MatchLiveEntity> matchFutureList;
  final List<MatchLiveEntity> matchLiveList;
  MatchState({
    required this.matchForCountry,
    required this.matchFutureList,
    required this.matchLiveList,
  });

  factory MatchState.init() => MatchState(
        matchFutureList: [],
        matchLiveList: [],
        matchForCountry: {},
      );
  MatchState copyWith({
    Map<String, List<MatchLiveEntity>>? matchForCountry,
    List<MatchLiveEntity>? matchLiveList,
    List<MatchLiveEntity>? matchFutureList,
  }) {
    return MatchState(
      matchFutureList: matchFutureList ?? this.matchFutureList,
      matchLiveList: matchLiveList ?? this.matchLiveList,
      matchForCountry: matchForCountry ?? this.matchForCountry,
    );
  }
}

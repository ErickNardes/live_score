import 'package:flutter_triple/flutter_triple.dart';
import 'package:live_score/app/features/matchs_league/domain/entities/usecase/i_get_match_of_league_usecase.dart';
import 'package:live_score/app/features/matchs_league/presenter/store/match_state.dart';

class MatchStore extends Store<MatchState> {
  final IGetMatchOfLeagueUsecase _iGetMatchOfLeagueUsecase;

  MatchStore(
    IGetMatchOfLeagueUsecase iGetMatchOfLeagueUsecase,
  )   : _iGetMatchOfLeagueUsecase = iGetMatchOfLeagueUsecase,
        super(MatchState.init());

  Future<void> getMatchOfLeague(int id) async {
    setLoading(true);
    final result = await _iGetMatchOfLeagueUsecase.call(id);
    result.fold(
      (l) => setError(l),
      (r) => update(
        state.copyWith(
            matchFutureList:
                r.where((element) => element.status == 'SCHEDULED').toList()),
      ),
    );
    setLoading(false);
  }

  Future<void> getMatchLive(int id) async {
    setLoading(true);
    final result = await _iGetMatchOfLeagueUsecase.call(id);
    result.fold(
      (l) => setError(l),
      (r) => update(
        state.copyWith(
            matchLiveList:
                r.where((element) => element.status == 'FINISHED').toList()),
      ),
    );
    setLoading(false);
  }
}

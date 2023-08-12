import 'package:flutter_triple/flutter_triple.dart';

import 'package:live_score/app/features/leagues/domain/usecase/i_get_leagues_usecase.dart';
import 'package:live_score/app/features/leagues/presenter/store/league_state.dart';

class LeagueStore extends Store<LeagueState> {
  final IGetLeaguesUsecase _iGetLeaguesUsecase;
  LeagueStore(
    IGetLeaguesUsecase iGetLeaguesUsecase,
  )   : _iGetLeaguesUsecase = iGetLeaguesUsecase,
        super(LeagueState.init());

  Future<void> getLeagues() async {
    setLoading(true);
    final result = await _iGetLeaguesUsecase.call();
    result.fold(
        (l) => setError(l), (r) => update(state.copiWith(listLeague: r)));
  }

  Future<void> selectedLeague(int indexList) async {
    update(state.copiWith(leagueSelected: indexList));
    print(indexList);
  }
}

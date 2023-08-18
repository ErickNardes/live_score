import 'package:flutter_triple/flutter_triple.dart';

import 'package:live_score/app/features/leagues/domain/usecase/i_get_leagues_usecase.dart';
import 'package:live_score/app/features/leagues/presenter/store/league_state.dart';

import '../../domain/entities/leagues_entity.dart';

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
      (l) => setError(l),
      (r) {
        final filteredLeagues =
            r.where((league) => league.odds == true).toList();

        final leaguesByCountry = <String, List<LeagueEntity>>{};

        for (final league in filteredLeagues) {
          final countryCode = league.code;
          if (!leaguesByCountry.containsKey(countryCode)) {
            leaguesByCountry[countryCode] = [];
          }
          leaguesByCountry[countryCode]!.add(league);
        }

        update(
          state.copiWith(
            listLeague: filteredLeagues,
            leaguesByCountry: leaguesByCountry,
          ),
        );
      },
    );
    setLoading(false);
  }

  Future<void> selectedLeague(int indexList) async {
    update(state.copiWith(leagueSelected: indexList));
  }
}

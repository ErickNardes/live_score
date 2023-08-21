import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:live_score/app/features/matchs_live/domain/entities/macthe_entity.dart';
import 'package:live_score/app/features/matchs_live/domain/entities/usecase/i_get_match_of_league_usecase.dart';
import 'package:live_score/app/features/matchs_live/presenter/store/match_state.dart';

class MatchStore extends Store<MatchState> implements Disposable {
  final IGetMatchOfLeagueUsecase _iGetMatchOfLeagueUsecase;

  MatchStore(
    IGetMatchOfLeagueUsecase iGetMatchOfLeagueUsecase,
  )   : _iGetMatchOfLeagueUsecase = iGetMatchOfLeagueUsecase,
        super(MatchState.init());

  Future<void> getMatchLive() async {
    final result = await _iGetMatchOfLeagueUsecase.call();
    result.fold(
      (l) => setError(l),
      (r) {
        final matchForCountry = <String, List<MatchLiveEntity>>{};

        for (final match in r) {
          final countryCode = match.countryLeague;
          if (!matchForCountry.containsKey(countryCode)) {
            matchForCountry[countryCode] = [];
          }
          matchForCountry[countryCode]!.add(match);
        }

        update(
          state.copyWith(
            matchLiveList: r,
            matchForCountry: matchForCountry,
          ),
        );
        print(state.matchLiveList.map((e) => e.statusElapsed).first);
      },
    );
  }

  @override
  void dispose() {
    super.destroy();
  }
}

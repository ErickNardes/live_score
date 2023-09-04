import 'package:flutter_triple/flutter_triple.dart';
import 'package:live_score/app/features/details_match/domain/usecase/i_get_details_match_usecase.dart';
import 'package:live_score/app/features/details_match/presenter/store/details_match_state.dart';

class DetailsMatchLiveStore extends Store<DetailsState> {
  final IGetDetailsMatchUsecase _iGetDetailsMatchUsecase;

  DetailsMatchLiveStore(
    IGetDetailsMatchUsecase iGetDetailsMatchUsecase,
  )   : _iGetDetailsMatchUsecase = iGetDetailsMatchUsecase,
        super(DetailsState.init());

  Future<void> getDetailsMatchLive(int idMatch) async {
    setLoading(true);

    final result = await _iGetDetailsMatchUsecase.call(idMatch);
    result.fold((l) => setError(l),
        (r) => update(state.copyWith(detailsMatchEntity: r)));

    setLoading(false);
  }
}

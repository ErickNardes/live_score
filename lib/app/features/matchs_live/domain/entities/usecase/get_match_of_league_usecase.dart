import 'package:fpdart/fpdart.dart';
import 'package:live_score/app/features/matchs_live/domain/entities/macthe_entity.dart';
import 'package:live_score/app/features/matchs_live/domain/entities/usecase/i_get_match_of_league_usecase.dart';
import 'package:live_score/app/features/matchs_live/domain/repository/i_get_match_of_league_repository.dart';

class GetMatchOfLeagueUsecase implements IGetMatchOfLeagueUsecase {
  final IGetMatchOfLeagueRepository _repository;

  const GetMatchOfLeagueUsecase(this._repository);

  @override
  Future<Either<Exception, List<MatchLiveEntity>>> call() async {
    return await _repository.call();
  }
}

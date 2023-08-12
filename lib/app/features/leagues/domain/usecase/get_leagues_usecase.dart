import 'package:fpdart/fpdart.dart';
import 'package:live_score/app/features/leagues/domain/entities/leagues_entity.dart';
import 'package:live_score/app/features/leagues/domain/repository/i_get_leagues_repository.dart';
import 'package:live_score/app/features/leagues/domain/usecase/i_get_leagues_usecase.dart';

class GetLeaguesUsecase implements IGetLeaguesUsecase {
  final IGetLeaguesRepository _repository;

  const GetLeaguesUsecase(this._repository);

  @override
  Future<Either<Exception, List<LeagueEntity>>> call() async {
    return await _repository.call();
  }
}

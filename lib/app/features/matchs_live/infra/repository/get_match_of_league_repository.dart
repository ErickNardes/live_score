import 'package:fpdart/fpdart.dart';
import 'package:live_score/app/features/matchs_live/domain/entities/macthe_entity.dart';
import 'package:live_score/app/features/matchs_live/domain/repository/i_get_match_of_league_repository.dart';
import 'package:live_score/app/features/matchs_live/infra/datasource/i_get_match_of_league_datasource.dart';

class GetMatchOfLeagueRepository implements IGetMatchOfLeagueRepository {
  final IGetMatchOfLeagueDatasource _datasource;

  const GetMatchOfLeagueRepository(this._datasource);

  @override
  Future<Either<Exception, List<MatchLiveEntity>>> call() async {
    try {
      final result = await _datasource.call();
      return Right(result);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}

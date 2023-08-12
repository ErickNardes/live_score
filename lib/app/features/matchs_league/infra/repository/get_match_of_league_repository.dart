import 'package:fpdart/fpdart.dart';
import 'package:live_score/app/features/matchs_league/domain/entities/macthe_entity.dart';
import 'package:live_score/app/features/matchs_league/domain/repository/i_get_match_of_league_repository.dart';
import 'package:live_score/app/features/matchs_league/infra/datasource/i_get_match_of_league_datasource.dart';

class GetMatchOfLeagueRepository implements IGetMatchOfLeagueRepository {
  final IGetMatchOfLeagueDatasource _datasource;

  const GetMatchOfLeagueRepository(this._datasource);

  @override
  Future<Either<Exception, List<MatchEntity>>> call(int id) async {
    try {
      final result = await _datasource.call(id);
      return Right(result);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}

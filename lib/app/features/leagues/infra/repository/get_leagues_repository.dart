import 'package:fpdart/fpdart.dart';
import 'package:live_score/app/features/leagues/domain/entities/leagues_entity.dart';
import 'package:live_score/app/features/leagues/domain/repository/i_get_leagues_repository.dart';
import 'package:live_score/app/features/leagues/infra/datasource/i_get_leagues_datasource.dart';

class GetLeagueRepository implements IGetLeaguesRepository {
  final IGetLeagueDatasource _datasource;

  const GetLeagueRepository(this._datasource);

  @override
  Future<Either<Exception, List<LeagueEntity>>> call() async {
    try {
      final response = await _datasource.call();
      return Right(response);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}

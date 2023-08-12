import 'package:fpdart/fpdart.dart';
import 'package:live_score/app/features/details_match/domain/entities/details_match_entity.dart';
import 'package:live_score/app/features/details_match/domain/repository/i_get_details_match_repository.dart';
import 'package:live_score/app/features/details_match/infra/datasource/i_get_details_match_datasource.dart';

class GetDetailsMatchRepository implements IGetDetailsMatchRepository {
  final IGetDetailsMatchDatasource _datasource;

  const GetDetailsMatchRepository(this._datasource);

  @override
  Future<Either<Exception, DetailsMatchEntity>> call(int idMatch) async {
    try {
      final response = await _datasource.call(idMatch);
      return Right(response);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}

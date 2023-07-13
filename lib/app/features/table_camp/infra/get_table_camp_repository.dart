import 'package:fpdart/fpdart.dart';
import 'package:live_score/app/features/table_camp/domain/repository/get_table_camp_repository.dart';
import 'package:live_score/app/features/table_camp/domain/table_camp_entity.dart';
import 'package:live_score/app/features/table_camp/infra/datasource/i_get_table_camp_datasource.dart';

class GetTableCampRepository implements IGetTableClubRepository {
  final IGetTableCampDatasource _datasource;

  const GetTableCampRepository(this._datasource);

  @override
  Future<Either<Exception, List<TableCampEntity>>> call(int id) async {
    try {
      final result = await _datasource.call(id);
      return Right(result);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}

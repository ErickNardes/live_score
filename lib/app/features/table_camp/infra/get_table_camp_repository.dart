import 'package:fpdart/fpdart.dart';
import 'package:live_score/app/features/table_camp/domain/repository/get_table_camp_repository.dart';
import 'package:live_score/app/features/table_camp/domain/table_camp_entity.dart';
import 'package:live_score/app/features/table_camp/infra/datasource/i_get_table_camp_datasource.dart';

import '../domain/params/get_table_camp_params.dart';

class GetTableCampRepository implements IGetTableClubRepository {
  final IGetTableCampDatasource _datasource;

  const GetTableCampRepository(this._datasource);

  @override
  Future<Either<Exception, List<TableCampEntity>>> call(
      GetTableCampParams params) async {
    try {
      final result = await _datasource.call(params);
      return Right(result);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}

import 'package:fpdart/fpdart.dart';
import 'package:live_score/app/features/table_camp/domain/params/get_table_camp_params.dart';
import 'package:live_score/app/features/table_camp/domain/table_camp_entity.dart';

abstract class IGetTableClubRepository {
  Future<Either<Exception, List<TableCampEntity>>> call(
      GetTableCampParams params);
}

import 'package:live_score/app/features/table_camp/domain/table_camp_entity.dart';

abstract class IGetTableCampDatasource {
  Future<List<TableCampEntity>> call(int id);
}

import 'package:live_score/app/features/table_camp/domain/table_camp_entity.dart';

import '../../domain/params/get_table_camp_params.dart';

abstract class IGetTableCampDatasource {
  Future<List<TableCampEntity>> call(GetTableCampParams params);
}

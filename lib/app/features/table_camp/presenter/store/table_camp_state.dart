import 'package:live_score/app/features/table_camp/domain/table_camp_entity.dart';

class TableCampState {
  final List<TableCampEntity> tableCamp;
  TableCampState({
    required this.tableCamp,
  });

  factory TableCampState.init() => TableCampState(
        tableCamp: [],
      );
  TableCampState copiWith({
    List<TableCampEntity>? tableCamp,
  }) {
    return TableCampState(tableCamp: tableCamp ?? this.tableCamp);
  }
}

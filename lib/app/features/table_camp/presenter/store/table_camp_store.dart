import 'package:flutter_triple/flutter_triple.dart';

import 'package:live_score/app/features/table_camp/domain/usecase/i_get_table_camp_usecase.dart';
import 'package:live_score/app/features/table_camp/presenter/store/table_camp_state.dart';

class TableCampStore extends Store<TableCampState> {
  final IGetTableCampUsecase _iGetTableCampUsecase;
  TableCampStore(
    IGetTableCampUsecase getTableCampUsecase,
  )   : _iGetTableCampUsecase = getTableCampUsecase,
        super(TableCampState.init());

  Future<void> getTableCamp(int id) async {
    final result = await _iGetTableCampUsecase.call(id);
    return result.fold((l) => setError(l), (r) {
      update(state.copiWith(tableCamp: r));
    });
  }
}

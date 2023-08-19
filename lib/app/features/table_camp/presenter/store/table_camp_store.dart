import 'package:flutter_triple/flutter_triple.dart';

import 'package:live_score/app/features/table_camp/domain/usecase/i_get_table_camp_usecase.dart';
import 'package:live_score/app/features/table_camp/presenter/store/table_camp_state.dart';

import '../../domain/params/get_table_camp_params.dart';

class TableCampStore extends Store<TableCampState> {
  final IGetTableCampUsecase _iGetTableCampUsecase;
  TableCampStore(
    IGetTableCampUsecase getTableCampUsecase,
  )   : _iGetTableCampUsecase = getTableCampUsecase,
        super(TableCampState.init());

  Future<void> getTableCamp(GetTableCampParams params) async {
    setLoading(true);
    final result = await _iGetTableCampUsecase.call(params);
    return result.fold((l) => setError(l), (r) {
      update(state.copiWith(tableCamp: r));
      setLoading(false);
    });
  }
}

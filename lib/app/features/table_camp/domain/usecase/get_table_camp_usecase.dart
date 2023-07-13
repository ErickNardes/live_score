import 'package:fpdart/fpdart.dart';
import 'package:live_score/app/features/table_camp/domain/repository/get_table_camp_repository.dart';
import 'package:live_score/app/features/table_camp/domain/table_camp_entity.dart';
import 'package:live_score/app/features/table_camp/domain/usecase/i_get_table_camp_usecase.dart';

class GetTableCampUsecase implements IGetTableCampUsecase {
  final IGetTableClubRepository _repository;

  const GetTableCampUsecase(this._repository);

  @override
  Future<Either<Exception, List<TableCampEntity>>> call(int id) async {
    return await _repository.call(id);
  }
}

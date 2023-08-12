import 'package:fpdart/fpdart.dart';
import 'package:live_score/app/features/details_match/domain/entities/details_match_entity.dart';
import 'package:live_score/app/features/details_match/domain/repository/i_get_details_match_repository.dart';
import 'package:live_score/app/features/details_match/domain/usecase/i_get_details_match_usecase.dart';

class GetDetailsMatchUsecase implements IGetDetailsMatchUsecase {
  final IGetDetailsMatchRepository _repository;

  const GetDetailsMatchUsecase(this._repository);

  @override
  Future<Either<Exception, DetailsMatchEntity>> call(int idMatch) async {
    return await _repository.call(idMatch);
  }
}

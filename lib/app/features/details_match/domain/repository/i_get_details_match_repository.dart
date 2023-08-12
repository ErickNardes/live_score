import 'package:fpdart/fpdart.dart';
import 'package:live_score/app/features/details_match/domain/entities/details_match_entity.dart';

abstract class IGetDetailsMatchRepository {
  Future<Either<Exception, DetailsMatchEntity>> call(int idMatch);
}

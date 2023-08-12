import 'package:fpdart/fpdart.dart';
import 'package:live_score/app/features/leagues/domain/entities/leagues_entity.dart';

abstract class IGetLeaguesRepository {
  Future<Either<Exception, List<LeagueEntity>>> call();
}

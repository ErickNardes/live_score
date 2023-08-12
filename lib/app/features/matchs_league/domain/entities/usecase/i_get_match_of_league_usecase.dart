import 'package:fpdart/fpdart.dart';
import 'package:live_score/app/features/matchs_league/domain/entities/macthe_entity.dart';

abstract class IGetMatchOfLeagueUsecase {
  Future<Either<Exception, List<MatchEntity>>> call(int id);
}

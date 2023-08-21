import 'package:fpdart/fpdart.dart';
import 'package:live_score/app/features/matchs_live/domain/entities/macthe_entity.dart';

abstract class IGetMatchOfLeagueRepository {
  Future<Either<Exception, List<MatchLiveEntity>>> call();
}

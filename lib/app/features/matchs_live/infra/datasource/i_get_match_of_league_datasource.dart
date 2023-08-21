import 'package:live_score/app/features/matchs_live/domain/entities/macthe_entity.dart';

abstract class IGetMatchOfLeagueDatasource {
  Future<List<MatchLiveEntity>> call();
}

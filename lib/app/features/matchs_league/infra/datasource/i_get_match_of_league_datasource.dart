import 'package:live_score/app/features/matchs_league/domain/entities/macthe_entity.dart';

abstract class IGetMatchOfLeagueDatasource {
  Future<List<MatchEntity>> call(int id);
}

import 'package:live_score/app/features/leagues/domain/entities/leagues_entity.dart';

abstract class IGetLeagueDatasource {
  Future<List<LeagueEntity>> call();
}

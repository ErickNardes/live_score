import 'package:live_score/app/features/details_match/domain/entities/details_match_entity.dart';

abstract class IGetDetailsMatchDatasource {
  Future<DetailsMatchEntity> call(int idMatch);
}

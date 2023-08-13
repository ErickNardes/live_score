// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:live_score/app/features/details_match/domain/entities/details_match_entity.dart';

class DetailsState {
  final List<DetailsMatchEntity> detailsMatchEntity;
  DetailsState({
    required this.detailsMatchEntity,
  });

  factory DetailsState.init() => DetailsState(
        detailsMatchEntity: [],
      );
}

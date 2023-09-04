import 'package:live_score/app/features/details_match/domain/entities/details_match_entity.dart';

class DetailsState {
  final List<DetailsMatchEntity> detailsMatchEntity;
  DetailsState({
    required this.detailsMatchEntity,
  });

  factory DetailsState.init() => DetailsState(
        detailsMatchEntity: [],
      );
  DetailsState copyWith({
    List<DetailsMatchEntity>? detailsMatchEntity,
  }) {
    return DetailsState(
      detailsMatchEntity: detailsMatchEntity ?? this.detailsMatchEntity,
    );
  }
}

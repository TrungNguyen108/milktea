part of 'like_provider.dart';

enum LikeStatus {Loading, Loaded , Success, Failure}
class LikeState extends Equatable {
  final LikeStatus status;
  final List<LikeModel> listLikes;

  const LikeState({
    this.status = LikeStatus.Loading,
    this.listLikes = const [],
  });

  LikeState copyWith({
    LikeStatus? status,
    List<LikeModel>? listLikes,
  }) {
    return LikeState(
      status: status ?? this.status,
      listLikes: listLikes ?? this.listLikes,
    );
  }

  @override
  List<Object> get props => [ status, listLikes];
}
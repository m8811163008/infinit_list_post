part of 'post_bloc.dart';

enum PostStatus { initial, success, failure }

/// `PostInitial` for loading
/// `PostSuccess` will tell presentation layer
/// it has content to render
/// `PostFailure` will tell the presentation
/// that an error has occurred while fetching
/// posts
/// * Posts will be the List<Post> witch will
/// be displayed
/// * hasReachedMax will tell the
/// presentation layer whether or not it has
/// reached the maximum number of posts
class PostState extends Equatable {
  const PostState({
    this.status = PostStatus.initial,
    this.posts = const <Post>[],
    this.hasReachedMax = false,
  });

  final PostStatus status;
  final List<Post> posts;
  final bool hasReachedMax;

  PostState copyWith({
    PostStatus? status,
    List<Post>? posts,
    bool? hasReachedMax,
  }) {
    return PostState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''PostState { status: $status, hasReachedMax: $hasReachedMax, posts: ${posts.length} }''';
  }

  @override
  List<Object> get props => [status, posts, hasReachedMax];
}

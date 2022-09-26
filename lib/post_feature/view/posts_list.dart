import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_infinite_list/post_feature/bloc/post_bloc.dart';
import 'package:flutter_infinite_list/post_feature/widget/widget.dart';

/// We need to implement our `PostsList` view which will present
/// our posts and hook up to our `PostBloc`
class PostsList extends StatefulWidget {
  // const PostsList({Key? key}) : super(key: key);
  const PostsList({super.key});

  @override
  State<PostsList> createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        switch (state.status) {
          case PostStatus.failure:
            return Center(
              child: Text('failure'),
            );
          case PostStatus.success:
            if (state.posts.isEmpty) {
              return Center(child: Text('no posts, add more'));
            }
            return ListView.builder(
              itemBuilder: (context, index) {
                return index >= state.posts.length
                    ? const BottomLoader()
                    : PostListItem(post: state.posts[index]);
              },
              itemCount: state.hasReachedMax
                  ? state.posts.length
                  : state.posts.length + 1,
              controller: _scrollController,
            );
          case PostStatus.initial:
            return const Center(
              child: CircularProgressIndicator(),
            );
        }
      },
    );
  }

  @override
  void dispose() {
    /// remove listener of _scrollController and then dispose it
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  /// Call back for [_scrollController] listener
  void _onScroll() {
    ///On each scroll change we check _isBottom and if it is
    ///true fetch post if possible
    if (_isBottom) context.read<PostBloc>().add(PostFetched());
  }

  bool get _isBottom {
    ///We calculate how far you have scrolled down the page
    ///and if our distance is >= 90% of our [maxScrollExtend] we
    /// add a [PostFetched] event in order to load more posts.
    if (!_scrollController.hasClients) return false;
    final maxScrollExtend = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScrollExtend * 0.9);
  }
}

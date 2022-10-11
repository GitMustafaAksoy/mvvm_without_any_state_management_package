part of post_view;


final _viewModel = PostViewModel();

Center postViewBody() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedBuilder(
            animation: _viewModel,
            builder: (context, child) {
              if (_viewModel.pageState == PageState.normal) {
                return const Text('NORMAL');
              } else if (_viewModel.pageState == PageState.loading) {
                return const CircularProgressIndicator();
              } else if (_viewModel.pageState == PageState.error) {
                return const Text('ERROR');
              } else {
                return listView();
              }
            })
      ],
    ),
  );
}

Expanded listView() {
  return Expanded(
    flex: 1,
    child: ListView.separated(
      separatorBuilder: (context, index) => const Divider(),
      itemCount: _viewModel.posts.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(_viewModel.posts[index].title!),
        subtitle: Text(_viewModel.posts[index].body!),
        leading: Text('Post Id: ${_viewModel.posts[index].id.toString()}'),
        trailing: Text(_viewModel.posts[index].userId.toString()),
      ),
    ),
  );
}
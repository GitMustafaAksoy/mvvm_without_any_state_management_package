part of post_view;

class PostViewModel extends ChangeNotifier {
  List<Post> posts = [];
  final url = "https://jsonplaceholder.typicode.com/posts";
  PageState pageState = PageState.normal;

  Future<void> getAllPosts() async {
    debugPrint('getAllPost Called');
    try {
      pageState = PageState.loading;
      debugPrint('List Loading');
      notifyListeners();
      final response = await Dio().get(url);
      await Future.delayed(const Duration(seconds: 3)); //fake delay for 5 sec.
      if (response.statusCode == HttpStatus.ok) {
        debugPrint('Http is ok');
        final responseData = response.data as List;
        posts = responseData.map((e) => Post.fromMap(e)).toList();
        pageState = PageState.success;
        notifyListeners();
      }
    } catch (e) {
      pageState = PageState.error;
      notifyListeners();
    }
  }
}

enum PageState { loading, error, success, normal }

import 'post.dart';

class PostsRepository {
  static List<Post> loadPost(Category category) {
    const allPosts = <Post> [

    ];
    if (category == Category.all) {
      return allPosts;
    } else {
      return allPosts.where((Post p) {
      }).toList();
    }
  }
}

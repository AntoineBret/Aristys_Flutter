import 'package:aristys_app/model/post_model.dart';

class AppState {

  AppState({
    this.readPosts
  });

  final List<Post> readPosts;

  static AppState initState() {
    return new AppState(readPosts: []);
  }
}

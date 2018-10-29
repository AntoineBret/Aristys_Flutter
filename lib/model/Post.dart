import 'package:json_annotation/json_annotation.dart';

/// This allows our `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'Post.g.dart';

/// This allows our `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.

/// This allows our `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.

@JsonSerializable()
class Post  {
  Post(this.posts, this.title, this.date, this.imgURL, this.content);

  @JsonKey(name: 'posts')
  List<Post> posts;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'date')
  String date;

  @JsonKey(name: 'featured_image')
  String imgURL;

  @JsonKey(name: 'content')
  String content;

  /// A necessary factory constructor for creating a new User instance
  /// from a map. We pass the map to the generated _$UserFromJson constructor.
  /// The constructor is named after the source class, in this case User.
  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}

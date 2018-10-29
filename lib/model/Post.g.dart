// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) {
  return Post(
      (json['posts'] as List)
          ?.map((e) =>
              e == null ? null : Post.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['title'] as String,
      json['date'] as String,
      json['featured_image'] as String,
      json['content'] as String);
}

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'posts': instance.posts,
      'title': instance.title,
      'date': instance.date,
      'featured_image': instance.imgURL,
      'content': instance.content
    };

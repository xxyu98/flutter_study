import 'package:freezed_annotation/freezed_annotation.dart';

part 'article.freezed.dart'; // 自动生成的文件，包含 freezed 类定义
part 'article.g.dart'; // 自动生成的文件，包含 JSON 序列化/反序列化的支持

@freezed
class ArticleModel with _$ArticleModel {
  factory ArticleModel({
    required int articleId,
    required String author,
    required String avatar,
    required String title,
    required String content,
    required String crateTime,
  }) = _ArticleModel;

  factory ArticleModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleModelFromJson(json);
}

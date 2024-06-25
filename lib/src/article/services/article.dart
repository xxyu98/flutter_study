import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_app/src/article/api/article.dart';
import 'package:nb_app/src/article/model/article.dart';

class ArticleListController extends GetxController {
  final repo = Get.find<ArticleRepository>();

  final isLoading = false.obs;

  final error = Rxn<String>();

  // data
  final list = <ArticleModel>[].obs;

  @override
  void onInit() {
    getList();
    super.onInit();
  }

  void setError(String? detail) {
    error.value = detail;
  }

  Future<void> getList() async {
    try {
      isLoading(true);
      list.value = await repo.getArticleList();
    } catch (e) {
      final detail = '发生错误 $e';
      debugPrint(detail);
      setError(detail);
    } finally {
      isLoading(false);
    }
  }
}

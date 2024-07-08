import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_app/src/article/controllers/article.dart';
import 'package:nb_app/src/article/widgets/list_item.dart';
import 'package:nb_app/src/common/abnormal_page/error.dart';
import 'package:nb_app/src/common/components/loading.dart';
import 'package:nb_app/src/common/components/toast.dart';

class ArticleListPage extends StatelessWidget {
  const ArticleListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ArticleListController());

    final data = controller.list;

    return Obx(
      () => controller.isLoading.isTrue
          ? const LoadingPage()
          : controller.error.value != null
              ? const ErrorPage(title: 'title', detail: 'detail')
              : Scaffold(
                  backgroundColor: const Color(0xfff1f2f3),
                  appBar: AppBar(
                    title: const Text("文章"),
                  ),
                  floatingActionButton: FloatingActionButton(
                    child: const Icon(Icons.add),
                    onPressed: () {
                      CustomToast.showToast(
                        context,
                        "指令下发失败",
                        isSuccess: false,
                      );
                    },
                  ),
                  body: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) =>
                        ArticleItem(data: data[index]),
                  ),
                ),
    );
  }
}

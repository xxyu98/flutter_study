import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nb_app/src/common/components/cell_group.dart';
import 'package:nb_app/src/login/controllers/login.dart';

class SettingPage extends StatelessWidget {
  SettingPage({super.key});

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserInfoController>();

    String getMaskedPhone(String? phone) {
      if (phone == null || phone.isEmpty) {
        return '';
      }
      if (phone.length == 11) {
        return phone.replaceRange(3, 7, '****');
      }
      return phone;
    }

    final baseInfo = [
      {
        'title': '头像',
        'value': Obx(
          () => CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(userController
                    .userInfo.value?.avatar ??
                'https://houndpos.oss-cn-hangzhou.aliyuncs.com/profile/banner.png'),
          ),
        ),
        'onTap': () => Get.toNamed('/profile/avatar')
      },
      {
        'title': '昵称',
        'value': Obx(
          () => Text(
            userController.userInfo.value?.nickname ?? '',
            style: const TextStyle(
              color: Color.fromRGBO(140, 140, 140, 1),
            ),
          ),
        ),
        'onTap': () => Get.toNamed('/profile/nickname')
      },
      {
        'title': '更换手机号',
        'value': Obx(
          () => Text(
            getMaskedPhone(userController.userInfo.value?.phone),
            style: const TextStyle(
              color: Color.fromRGBO(140, 140, 140, 1),
            ),
          ),
        ),
      },
      {
        'title': '修改密码',
      },
    ];

    final otherInfo = [
      {
        'title': '清理缓存',
        'value': '12.32MB',
      },
      {
        'title': '隐私政策',
      },
      {
        'title': '当前版本',
        'value': '2.32.14',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('设置'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        color: const Color.fromRGBO(245, 245, 245, 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 8),
              child: const Text(
                '基本资料',
                style: TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(140, 140, 140, 1),
                ),
              ),
            ),
            CellGroup(cellsData: baseInfo),
            Container(
              margin: const EdgeInsets.only(left: 8),
              child: const Text(
                '其他',
                style: TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(140, 140, 140, 1),
                ),
              ),
            ),
            CellGroup(cellsData: otherInfo),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  box.remove('userInfo');
                  Get.toNamed('/login');
                },
                style: ElevatedButton.styleFrom(),
                child: const Text(
                  "退出登录",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

void changeAvatar(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) => Container(
      color: Colors.white,
      height: 180,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              child: TextButton(onPressed: () {}, child: const Text('相册选取')),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              child: TextButton(onPressed: () {}, child: const Text('拍照')),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              child: TextButton(onPressed: () {}, child: const Text('取消')),
            ),
          ),
        ],
      ),
    ),
  );
}

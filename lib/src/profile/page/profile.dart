import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_app/src/common/components/cell_group.dart';
import 'package:nb_app/src/common/components/icon_font.dart';
import 'package:nb_app/src/login/controllers/login.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final actionList = [
    {
      'prefix': IconFonts.devicesList,
      'title': '设备列表',
    },
    {
      'prefix': IconFonts.myOrder,
      'title': '我的订单',
    },
    {
      'prefix': IconFonts.teamwork,
      'title': '团队协作',
    },
    {
      'prefix': IconFonts.alarmSettings,
      'title': '报警设置',
    },
    {
      'prefix': IconFonts.shareManage,
      'title': '共享管理',
    },
    {
      'prefix': IconFonts.tagManage,
      'title': '标记管理',
    },
    {
      'prefix': IconFonts.helpAndFeedback,
      'title': '帮助与反馈',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserInfoController>();

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                alignment: Alignment.topCenter,
                width: double.infinity,
                height: 275,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(24, 40, 24, 0),
                  width: double.infinity,
                  height: 232,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://houndpos.oss-cn-hangzhou.aliyuncs.com/profile/banner.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(
                        () => Row(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 2),
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                  image: NetworkImage(userController.userInfo
                                              .value!.avatar?.isNotEmpty ==
                                          true
                                      ? userController.userInfo.value!.avatar!
                                      : 'https://houndpos.oss-cn-hangzhou.aliyuncs.com/profile/def_avatar.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  userController.userInfo.value!.nickname
                                              ?.isNotEmpty ==
                                          true
                                      ? userController.userInfo.value!.nickname!
                                      : userController.userInfo.value!.username,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  userController.userInfo.value?.phone ?? '',
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 8),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 1,
                          ),
                          color: const Color.fromRGBO(255, 255, 255, .1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed('/profile/setting');
                          },
                          child: const Row(
                            children: [
                              Icon(
                                IconFonts.setting,
                                size: 16,
                                color: Colors.white,
                              ),
                              SizedBox(width: 4),
                              Text(
                                '设置',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned.fill(
                top: 190,
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  // height: 80,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(110, 77, 243, .1),
                          offset: Offset(0, 2),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildIconTextItem(IconFonts.offlineMap, '离线地图'),
                        _buildIconTextItem(IconFonts.bindDevice, '绑定设备'),
                        _buildIconTextItem(IconFonts.fenceManage, '围栏管理'),
                        _buildIconTextItem(IconFonts.houndFiles, '猎犬档案'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          CellGroup(cellsData: actionList),
        ],
      ),
    );
  }
}

Widget _buildIconTextItem(IconData icon, String text) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(
        icon,
        size: 24,
      ),
      const SizedBox(height: 8),
      Text(
        text,
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
    ],
  );
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nb_app/src/common/components/icon_font.dart';
import 'package:nb_app/src/login/model/user_info.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    final box = GetStorage();

    final userInfo = UserInfoModel.fromJson(box.read('userInfo'));

    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
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
                      Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(38),
                              image: const DecorationImage(
                                image: NetworkImage(
                                    'https://houndpos.oss-cn-hangzhou.aliyuncs.com/profile/def_avatar.png'),
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
                                userInfo.nickname?.isNotEmpty == true
                                    ? userInfo.nickname!
                                    : userInfo.username,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                userInfo.phone ?? '',
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        ],
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
          const ActionList(),
        ],
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  final String userName;
  final String userPhone;
  const UserInfo({super.key, required this.userName, required this.userPhone});

  @override
  Widget build(BuildContext context) {
    return const Text('data');
  }
}

Widget _buildIconTextItem(IconData icon, String text) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(
        icon,
        size: 24,
        color: const Color.fromRGBO(51, 51, 51, 1),
      ),
      const SizedBox(height: 8),
      Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          color: Color.fromRGBO(51, 51, 51, 1),
        ),
      ),
    ],
  );
}

class ActionList extends StatelessWidget {
  const ActionList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(110, 77, 243, 0.10),
            offset: Offset(0, 2),
            blurRadius: 6,
          ),
        ],
      ),
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildActionItem(IconFonts.devicesList, '设备列表'),
          _buildActionItem(IconFonts.myOrder, '我的订单'),
          _buildActionItem(IconFonts.teamwork, '团队协作'),
          _buildActionItem(IconFonts.alarmSettings, '报警设置'),
          _buildActionItem(IconFonts.shareManage, '共享管理'),
          _buildActionItem(IconFonts.tagManage, '标记管理'),
          _buildActionItem(IconFonts.helpAndFeedback, '帮助与反馈'),
        ],
      ),
    );
  }

  Widget _buildActionItem(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
      height: 56,
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: const Color.fromRGBO(51, 51, 51, 1),
          ),
          const SizedBox(width: 6),
          Text(
            text,
            style: const TextStyle(
              fontSize: 15,
              color: Color.fromRGBO(51, 51, 51, 1),
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.navigate_next,
            color: Color.fromRGBO(103, 103, 103, 1),
          ),
        ],
      ),
    );
  }
}

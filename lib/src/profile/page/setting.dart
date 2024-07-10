import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nb_app/src/common/components/cell_group.dart';

class SettingPage extends StatelessWidget {
  SettingPage({super.key});

  final box = GetStorage();

  final baseInfo = [
    {
      'title': '头像',
      'value': Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: const DecorationImage(
            image: NetworkImage(
                'https://houndpos.oss-cn-hangzhou.aliyuncs.com/profile/def_avatar.png'),
            fit: BoxFit.fill,
          ),
        ),
      ),
    },
    {
      'title': '昵称',
      'value': '15893254589',
    },
    {
      'title': '更换手机号',
      'value': '158****4589',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('设置'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 24),
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
            padding: const EdgeInsets.only(left: 24),
            child: const Text(
              '其他',
              style: TextStyle(
                fontSize: 14,
                color: Color.fromRGBO(140, 140, 140, 1),
              ),
            ),
          ),
          CellGroup(cellsData: otherInfo),
          Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF694EEA),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "退出登录",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              onPressed: () {
                box.remove('userInfo');
                Get.toNamed('/login');
              },
            ),
          )
        ],
      ),
    );
  }
}

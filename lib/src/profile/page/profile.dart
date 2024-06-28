import 'package:flutter/material.dart';
import 'package:nb_app/src/common/components/icon_font.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF694EEA),
        ),
        body: const Column(
          children: [
            UserInfo(
              userName: '大聪明',
              userPhone: '16666666666',
            ),
            ActionList(),
          ],
        ));
  }
}

class UserInfo extends StatelessWidget {
  final String userName;
  final String userPhone;
  const UserInfo({super.key, required this.userName, required this.userPhone});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.topCenter,
          width: double.infinity,
          height: 210,
          child: Container(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
            width: double.infinity,
            height: 170,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF694EEA), Color.fromRGBO(105, 78, 234, .6)],
                stops: [0.02, 0.90],
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
                          image: AssetImage('assets/images/def_avatar.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          userName,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          userPhone,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                    color: const Color.fromRGBO(255, 255, 255, .1),
                    borderRadius: BorderRadius.circular(20),
                  ),
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
              ],
            ),
          ),
        ),
        Positioned.fill(
          top: 130,
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            height: 80,
            child: Container(
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildIconTextItem(Icons.list_alt, '海量课程'),
                  _buildIconTextItem(Icons.add_reaction_outlined, '丰富活动'),
                  _buildIconTextItem(Icons.chat_outlined, '专属微信群'),
                  _buildIconTextItem(Icons.update, '每日更新'),
                ],
              ),
            ),
          ),
        ),
      ],
    );
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
          _buildActionItem(Icons.computer_sharp, '学习数据'),
          _buildActionItem(Icons.text_decrease_sharp, '等级测试'),
          _buildActionItem(Icons.task_alt, '我的任务'),
          _buildActionItem(Icons.check_box_outlined, '组队打卡'),
          _buildActionItem(Icons.upgrade, '学习提升'),
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

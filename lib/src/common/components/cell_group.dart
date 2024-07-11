import 'package:flutter/material.dart';

class CellItem {
  final IconData? prefix; // 前置图标（可选）
  final String title; // 标题
  final dynamic value; // 右侧内容（可选）
  final IconData? suffix; // 后置图标（可选）
  final VoidCallback? onTap; // 点击事件回调（可选）

  CellItem({
    this.prefix,
    required this.title,
    this.value,
    this.suffix,
    this.onTap,
  });
}

class CellGroup extends StatelessWidget {
  final List<Map<String, dynamic>> cellsData;

  const CellGroup({super.key, required this.cellsData});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Column(
          children: cellsData.map((data) {
            return _buildActionItem(CellItem(
              prefix: data['prefix'],
              title: data['title'],
              value: data['value'],
              suffix: data['suffix'] ?? Icons.navigate_next,
              onTap: data['onTap'],
            ));
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildActionItem(CellItem cell) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: const Color.fromRGBO(105, 78, 234, .1),
        onTap: cell.onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: 56,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (cell.prefix != null)
                Icon(
                  cell.prefix,
                  size: 20,
                ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  cell.title,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              if (cell.value != null)
                cell.value is String
                    ? Text(
                        cell.value,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Color.fromRGBO(140, 140, 140, 1),
                        ),
                      )
                    : cell.value as Widget,
              const SizedBox(width: 6),
              if (cell.suffix != null)
                Icon(
                  cell.suffix,
                  color: const Color.fromRGBO(140, 140, 140, 1),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

### 起步

- 安装配置好flutter环境

- 创建一个flutter计数器模板

- ```shell
  flutter create nb_app
  ```

### 文章页面

- 建立文件目录

- 安装 [GetX](https://pub.dev/packages/get)  一个强大np的东西

- ```
  flutter pub add get
  ```

- 安装 [freezed](https://pub.dev/packages/freezed) 用于管理数据模型

- ```shell
  flutter pub add freezed_annotation
  flutter pub add dev:build_runner
  flutter pub add dev:freezed
  # if using freezed to generate fromJson/toJson, also add:
  flutter pub add json_annotation
  flutter pub add dev:json_serializable
  ```

- 
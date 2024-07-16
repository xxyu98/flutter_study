import 'package:flutter/material.dart';

import 'package:amap_flutter_map/amap_flutter_map.dart';
import 'package:amap_flutter_base/amap_flutter_base.dart';
import 'package:nb_app/src/monitor/page/amap_page.dart';

class MonitorPage extends StatefulWidget {
  const MonitorPage({super.key});

  @override
  State<StatefulWidget> createState() => _ShowMapPageState();
}

class _ShowMapPageState extends State<MonitorPage> with AMapLocationStateMixin {
  @override
  String get iosKey => 'c09ac11dab055bea5c5ccdde2fef9a5e';

  @override
  String get androidKey => '1dbf56e2e8a4d0e4cdc2df9efd36bc71';

  String? get mapContentApprovalNumber =>
      AMapApprovalNumber.mapContentApprovalNumber;
  String? get satelliteImageApprovalNumber =>
      AMapApprovalNumber.satelliteImageApprovalNumber;

  @override
  void initState() {
    super.initState();

    startLocation();
  }

  AMapController? aMapController;

  @override
  Widget build(BuildContext context) {
    final AMapPage map = AMapPage(
      iosKey,
      androidKey,
      onMapCreated: (AMapController controller) {
        aMapController = controller;
      },
    );

    List<Widget> approvalNumberWidget = [
      if (null != mapContentApprovalNumber) Text(mapContentApprovalNumber!),
      if (null != satelliteImageApprovalNumber)
        Text(satelliteImageApprovalNumber!),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("高德地图"),
        actions: [
          TextButton(
              onPressed: () {
                LatLng latlng = LatLng(locationInfo.latitude ?? 39.909187,
                    locationInfo.longitude ?? 116.397451);
                CameraUpdate cameraUpdate = CameraUpdate.newLatLng(latlng);
                aMapController?.moveCamera(cameraUpdate);
              },
              child: const Icon(
                Icons.location_on_rounded,
                color: Colors.red,
              ))
        ],
      ),
      body: map,
      drawer: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width * 0.8,
        child: SafeArea(
          child: Column(
            children: [
              createButtonContainer(),
              Expanded(child: resultList()),
              ...approvalNumberWidget,
            ],
          ),
        ),
      ),
    );
  }

  Widget createButtonContainer() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          onPressed: startLocation,
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.blue),
            foregroundColor: WidgetStateProperty.all(Colors.white),
          ),
          child: const Text('开始定位'),
        ),
        Container(width: 20.0),
        ElevatedButton(
          onPressed: stopLocation,
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.blue),
            foregroundColor: WidgetStateProperty.all(Colors.white),
          ),
          child: const Text('停止定位'),
        )
      ],
    );
  }

  Widget resultList() {
    List<Widget> widgets = <Widget>[];

    locationResult.forEach((key, value) {
      widgets.add(
        Text(
          '$key: $value',
          softWrap: true,
          style: const TextStyle(color: Colors.lightGreenAccent),
        ),
      );
    });

    return ListView(
      padding: const EdgeInsets.all(8),
      children: widgets,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_map_example/pages/zoombuttons_plugin_option.dart';
import 'package:flutter_map_example/widgets/drawer.dart';
import 'package:latlong2/latlong.dart';

class PluginZoomButtons extends StatelessWidget {
  static const String route = '/plugin_zoombuttons';

  const PluginZoomButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ZoomButtonsPlugins')),
      drawer: buildDrawer(context, PluginZoomButtons.route),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Flexible(
              child: FlutterMap(
                options: const MapOptions(
                  initialCenter: LatLng(51.5, -0.09),
                  initialZoom: 5,
                ),
                nonRotatedChildren: const [
                  FlutterMapZoomButtons(
                    minZoom: 4,
                    maxZoom: 19,
                    mini: true,
                    padding: 10,
                    alignment: Alignment.bottomRight,
                  ),
                ],
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://{s}.maps.2gis.com/tiles?x={x}&y={y}&z={z}&v=1',
                    userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

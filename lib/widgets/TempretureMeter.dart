import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class TempretureMeter extends StatelessWidget {
  const TempretureMeter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: SfRadialGauge(enableLoadingAnimation: true, axes: <RadialAxis>[
          RadialAxis(minimum: -30, maximum: 30, ranges: <GaugeRange>[
            GaugeRange(startValue: -30, endValue: 0, color: Colors.green),
            GaugeRange(startValue: 0, endValue: 10, color: Colors.orange),
            GaugeRange(startValue: 10, endValue: 30, color: Colors.red)
          ], pointers: <GaugePointer>[
            NeedlePointer(value: 0)
          ], annotations: <GaugeAnnotation>[
            GaugeAnnotation(
                widget: Container(
                    child: Text('0\u00B0F',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold))),
                angle: 90,
                positionFactor: 0.5)
          ])
        ]));
  }
}

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Gauge extends StatelessWidget {
  const Gauge({super.key});

  Widget _getLinearGauge() {
    return Container(
      margin: const EdgeInsets.all(10),
      child: SfLinearGauge(
          minimum: 0.0,
          maximum: 100.0,
          orientation: LinearGaugeOrientation.horizontal,
          majorTickStyle: const LinearTickStyle(length: 20),
          axisLabelStyle: const TextStyle(fontSize: 12.0, color: Colors.black),
          axisTrackStyle: const LinearAxisTrackStyle(
              color: Colors.cyan,
              edgeStyle: LinearEdgeStyle.bothFlat,
              thickness: 15.0,
              borderColor: Colors.grey)),
    );
  }

  Widget _getGauge({bool isRadialGauge = true}) {
    if (isRadialGauge) {
      return _getRadialGauge();
    } else {
      return _getLinearGauge();
    }
  }

  Widget _getRadialGauge() {
    String gaugeTitle = "94,40";
    String gaugeSubTitle = "Kg";
    String gaugeExtraInfo = "Sobrepeso";

    return Center(
      child: SfRadialGauge(axes: <RadialAxis>[
        RadialAxis(
            interval: 10,
            startAngle: 180,
            endAngle: 0,
            showTicks: false,
            showLabels: false,
            axisLineStyle: const AxisLineStyle(
                thickness: 15, cornerStyle: CornerStyle.bothCurve),
            pointers: const <GaugePointer>[
              RangePointer(
                  value: 73,
                  width: 15,
                  color: Color(0xFFFFCD60),
                  enableAnimation: true,
                  cornerStyle: CornerStyle.bothCurve)
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                  widget: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                        child: Text(
                          gaugeTitle,
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                        child: Text(gaugeSubTitle,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 20)),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                        child: Text(
                          gaugeExtraInfo,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.amber),
                        ),
                      ),
                    ],
                  ),
                  angle: 270,
                  positionFactor: 0.5)
            ])
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: _getGauge());
  }
}

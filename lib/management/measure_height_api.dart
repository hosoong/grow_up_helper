import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:flutter/material.dart';
import 'package:grow_up_helper/survey/survey_widgets.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'package:collection/collection.dart';

import '../main.dart';

class MeasurePage extends StatefulWidget {
  MeasurePage({required this.appState});

  ApplicationState appState;

  @override
  _MeasurePageState createState() => _MeasurePageState();
}

class _MeasurePageState extends State<MeasurePage> {
  late ARKitController arkitController;
  vector.Vector3? lastPosition;
  String? _distance = '103.00 cm';

  @override
  void dispose() {
    arkitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      body: Column(children:[
        Container(
          width:MediaQuery.of(context).size.width, height:MediaQuery.of(context).size.height*0.8,
        child: ARKitSceneView(
          enableTapRecognizer: true,
          onARKitViewCreated: onARKitViewCreated,
        ),
      ),
        SizedBox(height:30),
        Visibility(
            visible: _distance != null,
            child: Text('측정된 키: ' + (_distance == null ? '' : _distance!))
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center,
            children:[WhiteButton(width: 128, height:40, text: '취소', onPressed: () {
              widget.appState.state = 'manageMeasure';
            }),
              SizedBox(width:15),
              Visibility(
                  visible: _distance != null,
                  child:BlueButton(width: 128, height:40, text: '확인', onPressed: () {
                    print(_distance);
                    var curr = widget.appState.userInfo['activeChildIndex'];
                    widget.appState.userInfo['children'][curr]['previousHeight'] = widget.appState.userInfo['children'][curr]['currentHeight'];
                    widget.appState.userInfo['children'][curr]['currentHeight'] = _distance!.split('cm')[0];

                    widget.appState.state = 'manageMeasure2';

                    widget.appState.notifyListeners();
                  }))
            ]),
      ])
  );

  void onARKitViewCreated(ARKitController arkitController) {
    this.arkitController = arkitController;
    this.arkitController.onARTap = (ar) {
      final point = ar.firstWhereOrNull(
            (o) => o.type == ARKitHitTestResultType.featurePoint,
      );
      if (point != null) {
        _onARTapHandler(point);
      }
    };
  }

  void _onARTapHandler(ARKitTestResult point) {
    final position = vector.Vector3(
      point.worldTransform.getColumn(3).x,
      point.worldTransform.getColumn(3).y,
      point.worldTransform.getColumn(3).z,
    );
    final material = ARKitMaterial(
        lightingModelName: ARKitLightingModel.constant,
        diffuse: ARKitMaterialProperty.color(Colors.blue));
    final sphere = ARKitSphere(
      radius: 0.006,
      materials: [material],
    );
    final node = ARKitNode(
      geometry: sphere,
      position: position,
    );
    arkitController.add(node);

    if (lastPosition != null) {
      final line = ARKitLine(
        fromVector: lastPosition!,
        toVector: position,
      );
      final lineNode = ARKitNode(geometry: line);
      arkitController.add(lineNode);

      final distance = _calculateDistanceBetweenPoints(position, lastPosition!);
      setState((){
        _distance = distance;
      });
      final point = _getMiddleVector(position, lastPosition!);
      _drawText(distance, point);
    }
    lastPosition = position;
  }

  String _calculateDistanceBetweenPoints(vector.Vector3 A, vector.Vector3 B) {
    final length = A.distanceTo(B);
    return '${(length * 100).toStringAsFixed(2)} cm';
  }

  vector.Vector3 _getMiddleVector(vector.Vector3 A, vector.Vector3 B) {
    return vector.Vector3((A.x + B.x) / 2, (A.y + B.y) / 2, (A.z + B.z) / 2);
  }

  void _drawText(String text, vector.Vector3 point) {
    final textGeometry = ARKitText(
      text: text,
      extrusionDepth: 1,
      materials: [
        ARKitMaterial(
          diffuse: ARKitMaterialProperty.color(Colors.red),
        )
      ],
    );
    const scale = 0.001;
    final vectorScale = vector.Vector3(scale, scale, scale);
    final node = ARKitNode(
      geometry: textGeometry,
      position: point,
      scale: vectorScale,
    );
    arkitController.add(node);
  }
}
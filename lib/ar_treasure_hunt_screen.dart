// import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:treasuredemo/main.dart';
// import 'package:vector_math/vector_math_64.dart' as vector64;
// import 'hint_screen.dart';



// class Artreasure extends StatefulWidget {
//   const Artreasure({super.key});

//   @override
//   State<Artreasure> createState() => _ArtreasureState();
// }

// class _ArtreasureState extends State<Artreasure> {
//   ArCoreController? augmentedRealityCoreController;
//   bool isSphereTapped = false;
//   ArCoreNode? sphereNode;
//   @override
//   void dispose() {
//     augmentedRealityCoreController?.dispose();
//     super.dispose();
//   }

//   augmentedRealityViewCreated(ArCoreController coreController) {
//     augmentedRealityCoreController = coreController;
//     displaySphere(augmentedRealityCoreController!);
//     augmentedRealityCoreController?.onNodeTap = (spherenode) => onTapHandler(spherenode);
//   }
//   void onTapHandler(String spherenode){
//     Navigator.of(context).push(
//           MaterialPageRoute(
//             builder: (context) => hintScreen(),
//           ),
//         );
//   }

//   displaySphere(ArCoreController coreController) async {
//     final ByteData textureBytes = await rootBundle.load('assets/gold.jpg');
//     final materials = ArCoreMaterial(
//       color: Colors.blue,
//       textureBytes: textureBytes.buffer.asUint8List(),
//     );

//     final sphere = ArCoreSphere(
//       materials: [materials],
//       radius: 0.2,
//     );

//     sphereNode = ArCoreNode(
//       name: 'spherenode',
//       shape: sphere,
//       position: vector64.Vector3(0, 0, -1.5),
//       rotation: vector64.Vector4(0, 0, 1, 1),
//     );

//     augmentedRealityCoreController!.addArCoreNode(sphereNode!);
//   }


    
//       @override
//       Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("AR Treasure Hunt"),
//         centerTitle: true,
//       ),
//       body: ArCoreView(
//           onArCoreViewCreated: augmentedRealityViewCreated,
//           enableTapRecognizer: true,
//         ),
//       );

//       }
//   }

  

  
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:treasuredemo/main.dart';
import 'package:vector_math/vector_math_64.dart' as vector64;
import 'hint_screen.dart';



class Artreasure extends StatefulWidget {
  const Artreasure({super.key});

  @override
  State<Artreasure> createState() => _ArtreasureState();
}

class _ArtreasureState extends State<Artreasure> {
  ArCoreController? augmentedRealityCoreController;
  bool isSphereTapped = false;
  ArCoreNode? sphereNode;
  @override
  void dispose() {
    augmentedRealityCoreController?.dispose();
    super.dispose();
  }

  final augmentedImages={
    'Image_1':'assets/a1.jpg',
    'Image_2':'assets/bird.jpg',
    'Image_3':'assets/botany.jpg',
    'Image_4':'assets/treetent.jpg',
    'Image_5':'assets/tree.jpg'
  };
  void onTapHandler(String spherenode){
    Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => hintScreen(),
          ),
        );
  }

  displaySphere(ArCoreController coreController, ArCoreAugmentedImage arCoreAugmentedImage) async {
  final ByteData textureBytes = await rootBundle.load('assets/gold.jpg');
  final materials = ArCoreMaterial(
    color: Colors.blue,
    textureBytes: textureBytes.buffer.asUint8List(),
  );

  final sphere = ArCoreSphere(
    materials: [materials],
    radius: 0.2,
  );

  final translation = arCoreAugmentedImage.centerPose.translation;
  sphereNode = ArCoreNode(
    name: 'spherenode',
    shape: sphere,
    position: translation,
  );

  augmentedRealityCoreController!.addArCoreNode(sphereNode!);
}

  augmentedRealityViewCreated(ArCoreController coreController) {
    augmentedRealityCoreController = coreController;
    augmentedRealityCoreController?.onTrackingImage=(arCoreAugmentedImage){
       if(augmentedImages.containsKey(arCoreAugmentedImage.name)){
         print('Image detected');
         

         displaySphere(augmentedRealityCoreController!,arCoreAugmentedImage);
          Fluttertoast.showToast(msg: 'Image DETECTED');
       }
     };
    augmentedRealityCoreController?.onNodeTap = (spherenode) => onTapHandler(spherenode);
  }


    
      @override
      Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AR Treasure Hunt"),
        centerTitle: true,
      ),
      body: ArCoreView(
          onArCoreViewCreated: augmentedRealityViewCreated,
          enableTapRecognizer: true,
        ),
      );

      }
  }

  
  

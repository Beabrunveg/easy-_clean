import 'package:auto_route/auto_route.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:taks_daily_app/core/router/router.dart';
import 'package:taks_daily_app/main.dart';

@RoutePage()
class PhotoCompleterScreen extends StatefulWidget {
  const PhotoCompleterScreen({
    required this.idTask,
    required this.isCompleted,
    required this.onPressed,
    super.key,
  });

  final int idTask;
  final bool isCompleted;
  final Function(String) onPressed;

  @override
  State<PhotoCompleterScreen> createState() => _PhotoCompleterScreenState();
}

class _PhotoCompleterScreenState extends State<PhotoCompleterScreen> {
  late CameraController controller;

  @override
  void initState() {
    controller = CameraController(cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle error
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      body: CameraPreview(
        controller,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            final image = await controller.takePicture();
            autoRouterPop(context);
            widget.onPressed(image.path);
          } catch (e) {
            print('Error al tomar la foto: $e');
          }
        },
        child: const Icon(Icons.camera),
      ),
    );
  }
}

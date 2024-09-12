import 'dart:io';

import 'package:flutter/material.dart';
import 'package:taks_daily_app/core/configs/configs.dart';

class PreviewPhoto extends StatelessWidget {
  const PreviewPhoto({
    required this.imagePath,
    super.key,
  });

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vista previa de la foto'),
      ),
      body: Center(
        child: Container(
          margin: padSy16,
          padding: padSy16,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: FileImage(
                File(imagePath),
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

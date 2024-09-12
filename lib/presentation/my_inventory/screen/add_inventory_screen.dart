import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taks_daily_app/components/components.dart';

@RoutePage()
class AddInventoryScreen extends StatefulWidget {
  const AddInventoryScreen({required this.onPressedSaved, super.key});
  final Function(String name, String image) onPressedSaved;

  @override
  State<AddInventoryScreen> createState() => _AddInventoryScreenState();
}

class _AddInventoryScreenState extends State<AddInventoryScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  File? _image;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() == true) {
      // Procesar los datos (guardar nombre e imagen)
      final name = _nameController.text;
      final image = _image?.path ?? '';
      widget.onPressedSaved(name, image);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Formulario con Imagen')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nombre'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese un nombre';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              if (_image == null)
                const Text('No se ha seleccionado ninguna imagen')
              else
                Image.file(_image!, height: 150, width: 150, fit: BoxFit.cover),
              const SizedBox(height: 16),
              ButtonPrimary(onPressed: _pickImage, label: 'Seleccionar Imagen'),
              const SizedBox(height: 16),
              ButtonPrimary(onPressed: _submitForm, label: 'Guardar'),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}

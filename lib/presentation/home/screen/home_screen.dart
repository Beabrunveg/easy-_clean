import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import 'package:taks_daily_app/components/components.dart';
import 'package:taks_daily_app/core/configs/configs.dart';
import 'package:taks_daily_app/core/router/router.dart';
import 'package:taks_daily_app/core/router/router_provider.gr.dart';
import 'package:taks_daily_app/presentation/home/screen/vm/home_vm.dart';
import 'package:taks_daily_app/presentation/home/widgets/widgets.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({
    required this.email,
    super.key,
  });
  final String email;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider<HomeVm>(
        create: (BuildContext screenContext) => HomeVm(widget.email),
        child: Consumer<HomeVm>(
          builder: (_, HomeVm viewModel, __) => Scaffold(
            drawer: DrawerHome(
              email: widget.email,
              homeVm: viewModel,
            ),
            appBar: AppBar(
              iconTheme: const IconThemeData(color: AppColors.blue100),
              leading: Builder(
                builder: (ctx) {
                  return IconButton(
                    icon: const Icon(Icons.menu_open_rounded),
                    onPressed: () {
                      Scaffold.of(ctx).openDrawer();
                    },
                  );
                },
              ),
              centerTitle: false,
              title: Text(
                '¡Buenos días ${viewModel.user?.name ?? ''}!',
                style: TextStyleApp.h1.black,
              ),
            ),
            body: _buildBody(context, viewModel),
          ),
        ),
      );

  Widget _buildBody(BuildContext context, HomeVm viewModel) {
    switch (viewModel.status) {
      case StatusHome.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );

      case StatusHome.loaded:
        return SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.all(8), // Ajusta el padding si es necesario
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    autoRouterPush(
                      context,
                      const MyInventoryScreenRoute(),
                    );
                  },
                  child: Container(
                    padding: padSy16,
                    margin: padSy16.copyWith(bottom: 8),
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Mi inventario', style: TextStyleApp.h2Bold.white),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                CardTaksToday(
                  date: DTForm.formatCurrentDate(),
                  taks: viewModel.tasks,
                  progress: viewModel.getPercentage,
                  onAdd: () async {
                    await showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4),
                          topRight: Radius.circular(4),
                        ),
                      ),
                      builder: (context) {
                        return StatefulBuilder(
                          builder:
                              (BuildContext context, StateSetter setState) {
                            return Wrap(
                              children: [
                                Padding(
                                  padding: padSy16,
                                  child: Column(
                                    children: [
                                      const Text(
                                        'Agregar tarea',
                                        style: TextStyleApp.h2Bold,
                                      ),
                                      gap16,
                                      InputCustom(
                                        controller: viewModel.nameTask,
                                        label: 'Nueva Tarea',
                                        hint: 'Ingresa tarea',
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            'Selecciona un color',
                                            style: TextStyleApp.h2Bold,
                                          ),
                                          IconButton(
                                            onPressed: () async {
                                              await showDialog(
                                                builder: (context) =>
                                                    AlertDialog(
                                                  title: const Text(
                                                    'Selecciona un color',
                                                  ),
                                                  content:
                                                      SingleChildScrollView(
                                                    child: ColorPicker(
                                                      pickerColor: viewModel
                                                          .colorSelected,
                                                      onColorChanged:
                                                          (Color color) {
                                                        viewModel
                                                                .colorSelected =
                                                            color;
                                                      },
                                                    ),
                                                  ),
                                                  actions: <Widget>[
                                                    ElevatedButton(
                                                      child: const Text(
                                                        'Seleccionar',
                                                      ),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                  ],
                                                ),
                                                context: context,
                                              );
                                              setState(() {});
                                            },
                                            icon: const Icon(
                                              Icons.color_lens,
                                              color: Colors.blue,
                                            ),
                                          ),
                                          const Spacer(),
                                          Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              color: viewModel.colorSelected,
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                          ),
                                        ],
                                      ),
                                      gap16,
                                      ButtonPrimary(
                                        onPressed: () async {
                                          unawaited(
                                            ProgressDialogo.showLoader(context),
                                          );
                                          await viewModel
                                              .onRegisterTask()
                                              .then((_) {
                                            ProgressDialogo.dissmiss(context);
                                            Navigator.of(context).pop();
                                          });
                                        },
                                        label: 'Agregar',
                                      ),
                                      gap8,
                                      ButtonSecondary(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        label: 'Cancelar',
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    );
                  },
                  onComplete: (idTask, isCompleted) => _showDialog(
                    context,
                    viewModel,
                    isCompleted,
                    idTask,
                    viewModel.tasks.firstWhere((e) => e.id == idTask).taskName,
                  ),
                  onDelete: (idTask) {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4),
                          topRight: Radius.circular(4),
                        ),
                      ),
                      builder: (context) {
                        return Wrap(
                          children: [
                            Padding(
                              padding: padSy16,
                              child: Column(
                                children: [
                                  const Text(
                                    '¿Eliminar tarea?',
                                    style: TextStyleApp.h2Bold,
                                  ),
                                  gap16,
                                  ButtonPrimary(
                                    onPressed: () async {
                                      unawaited(
                                        ProgressDialogo.showLoader(context),
                                      );
                                      await viewModel
                                          .onDeleteTask(idTask)
                                          .then((_) {
                                        ProgressDialogo.dissmiss(context);
                                        Navigator.of(context).pop();
                                      });
                                    },
                                    label: 'Eliminar',
                                  ),
                                  gap8,
                                  ButtonSecondary(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    label: 'Cancelar',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                Padding(
                  padding: padSyH16,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Tareas pasadas',
                      style: TextStyleApp.body.gray.w500,
                    ),
                  ),
                ),
                gap16,
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: viewModel.dailyPast.length,
                  itemBuilder: (context, index) {
                    final daily = viewModel.dailyPast[index];
                    return CardTaksPast(
                      date: DTForm.formatDate(daily.day),
                      taks: const [],
                      progress: 0,
                    );
                  },
                ),
              ],
            ),
          ),
        );

      case StatusHome.error:
        return const Center(
          child: Text('Error al cargar la información'),
        );
    }
  }

  void _showDialog(
    BuildContext context,
    HomeVm viewModel,
    bool isCompleted,
    int idTask,
    String name,
  ) {
    final controller = TextEditingController(text: name);
    var isEditing = false;
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(4),
          topRight: Radius.circular(4),
        ),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Wrap(
              children: [
                Padding(
                  padding: padSy16,
                  child: Column(
                    children: [
                      if (!isCompleted)
                        const Text(
                          '¿Deseas desmarcar esta tarea?',
                          style: TextStyleApp.h2Bold,
                        )
                      else
                        const Text(
                          '¿Terminaste con estas tareas?',
                          style: TextStyleApp.h2Bold,
                        ),
                      gap16,
                      ButtonPrimary(
                        onPressed: () async {
                          autoRouterPush(
                            context,
                            PhotoCompleterScreenRoute(
                              idTask: idTask,
                              isCompleted: isCompleted,
                              onPressed: (image) async {
                                unawaited(
                                  ProgressDialogo.showLoader(context),
                                );
                                await viewModel
                                    .onCompletedTask(
                                  idTask,
                                  isCompleted,
                                  image,
                                )
                                    .then((_) {
                                  ProgressDialogo.dissmiss(context);
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();
                                });
                              },
                            ),
                          );
                        },
                        label: isCompleted ? 'Si, Tomar Foto' : 'Descompletar',
                      ),
                      gap8,
                      InputCustom(
                        controller: controller,
                        label: 'Tarea',
                        hint: 'Ingrese tarea',
                        isEnabled: isEditing,
                      ),
                      gap8,
                      ButtonPrimary(
                        onPressed: () async {
                          setState(() {
                            isEditing = !isEditing;
                          });
                          if (isEditing) {
                            controller.text = name;
                          } else {
                            unawaited(
                              ProgressDialogo.showLoader(context),
                            );
                            await viewModel
                                .onUpdateTask(
                              idTask,
                              controller.text,
                            )
                                .then((_) {
                              ProgressDialogo.dissmiss(context);
                              Navigator.of(context).pop();
                            });
                          }
                        },
                        label: !isEditing ? 'Editar' : 'Guardar',
                      ),
                      gap8,
                      ButtonSecondary(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        label: 'Cancelar',
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

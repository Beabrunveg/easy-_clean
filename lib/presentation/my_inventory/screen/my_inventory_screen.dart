import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taks_daily_app/components/components.dart';
import 'package:taks_daily_app/core/configs/configs.dart';
import 'package:taks_daily_app/core/router/router.dart';
import 'package:taks_daily_app/core/router/router_provider.gr.dart';
import 'package:taks_daily_app/presentation/my_inventory/screen/vm/my_inventory_vm.dart';

@RoutePage()
class MyInventoryScreen extends StatelessWidget {
  const MyInventoryScreen({super.key});

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider<MyInventoryVm>(
        create: (BuildContext screenContext) => MyInventoryVm(),
        child: Consumer<MyInventoryVm>(
          builder: (_, MyInventoryVm viewModel, __) => Scaffold(
            appBar: AppBar(
              title: const Text(
                '¡Bienvenido a tu inventario!',
                style: TextStyleApp.h2Bold,
              ),
            ),
            body: Padding(
              padding: padSy16.copyWith(bottom: 0),
              child: Column(
                children: [
                  const Text(
                    'Aquí podrás ver todos los productos que tienes en tu inventario',
                    style: TextStyleApp.body,
                  ),
                  gap8,
                  const Divider(
                    height: 2,
                    color: AppColors.gray,
                  ),
                  gap24,
                  _buildBody(viewModel, context),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: AppColors.blue100,
              onPressed: () {
                autoRouterPush(
                  context,
                  AddInventoryScreenRoute(
                    onPressedSaved: (name, image) async {
                      unawaited(ProgressDialogo.showLoader(context));
                      await viewModel.addInventory(name, image);
                      ProgressDialogo.dissmiss(context);
                      autoRouterPop(context);
                    },
                  ),
                );
              },
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
  Widget _buildBody(MyInventoryVm viewModel, BuildContext context) {
    switch (viewModel.status) {
      case MyInventoryStatus.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case MyInventoryStatus.error:
        return const Center(
          child: Text('Error al cargar el inventario'),
        );
      case MyInventoryStatus.loaded:
        final listInventory = viewModel.myInventory.isEmpty;
        if (listInventory) {
          return const Center(
            child: Text('No hay articulos en tu inventario'),
          );
        }
        return Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: viewModel.myInventory.length,
            itemBuilder: (context, index) {
              final inventory = viewModel.myInventory[index];
              return Container(
                margin: padSy8,
                padding: padSy8,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.gray100,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.inventory_rounded,
                          color: AppColors.blue100,
                        ),
                        space8,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Nombre:',
                              style: TextStyleApp.bodyBold,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: Text(
                                inventory.name,
                                style: TextStyleApp.h2,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    gap8,
                    Stack(
                      children: [
                        Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.gray100,
                            image: DecorationImage(
                              image: FileImage(
                                File(inventory.image),
                              ),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            margin: padSy2,
                            decoration: BoxDecoration(
                              color: AppColors.red,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: IconButton(
                              onPressed: () {
                                viewModel.deleteInventory(inventory.id);
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        );
    }
  }
}

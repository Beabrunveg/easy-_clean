import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taks_daily_app/core/configs/configs.dart';
import 'package:taks_daily_app/core/router/router_provider.dart';
import 'package:taks_daily_app/presentation/changed_theme.dart';
import 'package:taks_daily_app/presentation/configuration/screen/vm/configuration_vm.dart';

@RoutePage()
class ConfigurationScreen extends StatelessWidget {
  const ConfigurationScreen({super.key});

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider<ConfigurationVm>(
        create: (BuildContext screenContext) => ConfigurationVm(),
        child: Consumer<ConfigurationVm>(
          builder: (_, ConfigurationVm viewModel, __) => Scaffold(
            appBar: AppBar(
              iconTheme: const IconThemeData(color: AppColors.blue100),
              leading: Builder(
                builder: (context) {
                  return IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    onPressed: () => autoRouterPop(context),
                  );
                },
              ),
              centerTitle: false,
              title: Text('Configuración', style: TextStyleApp.h1.black),
            ),
            body: Padding(
              padding: padSy16,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Dark mode', style: TextStyleApp.body.black.w500),
                      Switch(
                        value: true,
                        activeColor: AppColors.green,
                        onChanged: (value) {
                          Provider.of<ThemeNotifier>(context).toggleTheme();
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Notificaciones',
                        style: TextStyleApp.body.black.w500,
                      ),
                      Switch(
                        value: true,
                        activeColor: AppColors.green,
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                  gap16,
                  Expanded(
                    child: Container(
                      padding: padSy8,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Retos semanales completos',
                            style: TextStyleApp.body.black.w500,
                          ),
                          gap16,
                          Expanded(
                            child: ListView.builder(
                              itemCount: viewModel.data.length,
                              itemBuilder: (context, index) {
                                final data = viewModel.data[index];
                                return data;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

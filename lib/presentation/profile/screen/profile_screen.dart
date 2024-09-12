import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taks_daily_app/components/components.dart';
import 'package:taks_daily_app/core/configs/configs.dart';
import 'package:taks_daily_app/core/router/router_provider.dart';
import 'package:taks_daily_app/presentation/home/home.dart';
import 'package:taks_daily_app/presentation/profile/profile.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    required this.email,
    required this.homeVm,
    super.key,
  });
  final String email;
  final HomeVm homeVm;

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider<ProfileVm>(
        create: (BuildContext screenContext) => ProfileVm(email),
        child: Consumer<ProfileVm>(
          builder: (_, ProfileVm viewModel, __) => Scaffold(
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
              title: Text('Mi perfil', style: TextStyleApp.h1.black),
            ),
            body: _buildBody(context, viewModel),
          ),
        ),
      );
  Widget _buildBody(BuildContext context, ProfileVm viewModel) {
    switch (viewModel.status) {
      case StatusProfile.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );

      case StatusProfile.loaded:
        return Padding(
          padding: padSy16,
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: _buildProfile(viewModel) as ImageProvider,
              ),
              gap16,
              TextButton(
                onPressed: () => viewModel.updateProfileImage(),
                child: Text(
                  'Cambiar imagen',
                  style: TextStyleApp.body.blue100.w700,
                ),
              ),
              gap16,
              InputCustom(
                controller: viewModel.nameController,
                label: 'Nombre',
                hint: 'Ingresa tu nombre.',
              ),
              gap8,
              InputCustom(
                controller: viewModel.passwordController,
                label: 'Contraseña',
                hint: 'Ingresa tu contraseña.',
                obscureText: true,
              ),
              gap8,
              InputCustom(
                controller: viewModel.phoneController,
                label: 'Teléfono',
                hint: 'Ingresa tu teléfono.',
              ),
              const Spacer(),
              ButtonPrimary(
                onPressed: () async {
                  unawaited(ProgressDialogo.showLoader(context));
                  await viewModel.onUpdatedUser().then((_) async {
                    await homeVm.getUserInformation();
                    ProgressDialogo.dissmiss(context);
                  });
                },
                label: 'Editar',
              ),
            ],
          ),
        );
      case StatusProfile.error:
        return const Center(
          child: Text('Error al cargar la información'),
        );
    }
  }

  dynamic _buildProfile(ProfileVm viewModel) {
    if (viewModel.user?.image != null) {
      return FileImage(File(viewModel.user!.image));
    }

    if (viewModel.profileImage != null) {
      return FileImage(File(viewModel.profileImage!.path));
    }

    return AssetImage(AssetsApp.avatar.path);
  }
}

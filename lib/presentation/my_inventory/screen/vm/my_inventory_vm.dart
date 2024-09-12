import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:taks_daily_app/src/injection.dart';
import 'package:taks_daily_app/src/models/inventory.dart';
import 'package:taks_daily_app/src/usecases/delete_inventory_usecase.dart';
import 'package:taks_daily_app/src/usecases/get_inventory_usecase.dart';
import 'package:taks_daily_app/src/usecases/insert_inventory_usecase.dart';

enum MyInventoryStatus {
  loading,
  loaded,
  error,
}

class MyInventoryVm extends ChangeNotifier {
  MyInventoryVm() {
    onInit();
  }

  void onInit() {
    getMyInventory();
  }

  List<Inventory> myInventory = [];

  MyInventoryStatus _status = MyInventoryStatus.loading;
  MyInventoryStatus get status => _status;
  set status(MyInventoryStatus value) {
    _status = value;
    notifyListeners();
  }

  Future<void> getMyInventory() async {
    status = MyInventoryStatus.loading;
    await Future<void>.delayed(
      const Duration(seconds: 1),
    );

    final result = await sl<GetInventory>().execute();
    result.match(
      (l) {
        log('Error: $l');
        myInventory = [];
        status = MyInventoryStatus.error;
      },
      (r) {
        myInventory = r;
        status = MyInventoryStatus.loaded;
      },
    );
  }

  Future<void> deleteInventory(int id) async {
    await sl<DeleteInventory>().execute(id);
    myInventory.clear();
    await getMyInventory();
  }

  Future<void> addInventory(String name, String image) async {
    await sl<InsertInventory>().execute(name, image);
    myInventory.clear();
    await getMyInventory();
  }
}

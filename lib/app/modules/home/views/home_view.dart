import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './widgets/province.dart';
import './widgets/city.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Provinsi(tipe: "asal"),
          Obx(
            () => controller.hiddenKotaAsal.isTrue
                ? SizedBox()
                : Kota(
                    provId: controller.provAsalId.value,
                    tipe: "asal",
                  ),
          ),
          Provinsi(tipe: "tujuan"),
          Obx(
            () => controller.hiddenKotaTujuan.isTrue
                ? SizedBox()
                : Kota(
                    provId: controller.provTujuanId.value,
                    tipe: "tujuan",
                  ),
          ),
        ],
      ),
    );
  }
}

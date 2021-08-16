import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../province_model.dart';
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
          DropdownSearch<Province>(
            label: "Provinsi",
            onFind: (String filter) async {
              Uri url =
                  Uri.parse("https://api.rajaongkir.com/starter/province");

              try {
                final response = await http.get(
                  url,
                  headers: {
                    "key": "0ae702200724a396a933fa0ca4171a7e",
                  },
                );

                var data = json.decode(response.body) as Map<String, dynamic>;

                var statusCode = data["rajaongkir"]["status"]["code"];

                if (statusCode != 200) {
                  throw data["rajaongkir"]["status"]["description"];
                }

                var listAllProvince =
                    data["rajaongkir"]["results"] as List<dynamic>;

                var models = Province.fromJsonList(listAllProvince);
                return models;
              } catch (err) {
                print(err);
                return List<Province>.empty();
              }
            },
            onChanged: (value) => print(value!.province),
            showSearchBox: true,
            searchBoxDecoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 25,
              ),
              hintText: "cari provinsi...",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            popupItemBuilder: (context, item, isSelected) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "${item.province}",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              );
            },
            itemAsString: (item) => item.province!,
          ),
        ],
      ),
    );
  }
}

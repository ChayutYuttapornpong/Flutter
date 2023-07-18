// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:lesson08/models/product_model.dart';
import 'package:lesson08/service/database.dart';
import 'package:lesson08/widgets/product_item.dart  ';

// ignore: camel_case_types
class Product_Lists extends StatelessWidget {
  const Product_Lists({super.key});

  @override
  Widget build(BuildContext context) {
    Database db = Database.instance;
    Stream<List<ProductModel?>> stream = db.getAllProductStream();
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: StreamBuilder<List<ProductModel?>>(
        stream: stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // ignore: prefer_is_empty
            if (snapshot.data!.length == 0) {
              return const Center(child: Text('ยังไม่มีข้อมูล'));
            }
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Dismissible(
                    key: UniqueKey(),
                    onDismissed: (direction) {
                      if (direction == DismissDirection.endToStart) {
                        db.deleteProduct(
                            product: snapshot.data![index] as ProductModel);
                      }
                    },
                    background: Container(color: Colors.red),
                    direction: DismissDirection.endToStart,
                    child: ProductItem(
                        product: snapshot.data![index] as ProductModel));
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

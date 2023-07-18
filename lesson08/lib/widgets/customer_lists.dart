// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:lesson08/models/customer_model.dart';

class CustomerLists extends StatelessWidget {
  final Future<List<CustomerModel?>> customerLists;
  const CustomerLists({super.key, required this.customerLists});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<CustomerModel?>>(
        future: customerLists,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // ignore: prefer_is_empty
            if (snapshot.data?.length == 0) {
              return const Center(child: Text('ยังไม่มีรายชื่อลูกค้า'));
            } else {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text(snapshot.data![index]!.name),
                    trailing: Text(snapshot.data![index]!.age.toString()),
                  );
                },
              );
            }
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

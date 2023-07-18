import 'package:flutter/material.dart';
import 'package:lesson08/models/product_model.dart';
import 'package:lesson08/service/database.dart';

class ProductForm extends StatefulWidget {
  final ProductModel product;
  // ignore: prefer_const_constructors_in_immutables
  ProductForm({super.key, required this.product});
  @override
  // ignore: library_private_types_in_public_api
  _ProductFormState createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  Database db = Database.instance;
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  @override
  void initState() {
    super.initState();
    // ignore: unnecessary_null_comparison
    if (widget.product != null) {
      nameController.text = widget.product.productName;
      priceController.text = widget.product.price.toString();
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ignore: unnecessary_null_comparison
          Text(widget.product != null
              ? 'แก้ไข ${widget.product.productName}'
              : 'เพิ่มสินค้าใหม่'),
          TextField(
            controller: nameController,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(labelText: 'ชื่อสินค้า'),
          ),
          TextField(
            controller: priceController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'ราคาสินค้า'),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _showOKButton(),
              const SizedBox(
                width: 10,
              ),
              _showCancelButton(context)
            ],
          )
        ],
      ),
    );
  }

  Widget _showOKButton() {
    return ElevatedButton(
      onPressed: () async {
        String newProductID =
            'PD${DateTime.now().millisecondsSinceEpoch.toString()}';
        await db.setProduct(
          product: ProductModel(
            // ignore: unnecessary_null_comparison
            id: widget.product == null ? newProductID : widget.product.id,
            productName: nameController.text,
            price: double.tryParse(priceController.text) ?? 0,
          ),
        );
        nameController.clear();
        priceController.clear();
        // ignore: use_build_context_synchronously
        Navigator.of(context).pop();
      },
      // ignore: unnecessary_null_comparison
      child: Text(widget.product == null ? 'เพิ่ม' : 'แก้ไข'),
    );
  }

  Widget _showCancelButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: const Text('ปิด'),
    );
  }
}

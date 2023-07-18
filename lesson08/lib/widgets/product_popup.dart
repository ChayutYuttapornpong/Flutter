import 'package:flutter/material.dart';
import 'package:lesson08/models/product_model.dart';
import 'package:lesson08/widgets/product_form.dart';

class ProductPopup extends StatelessWidget {
  final ProductModel product;
  const ProductPopup({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
          padding: const EdgeInsets.all(30),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              color: Colors.white),
          height: MediaQuery.of(context).size.height * 0.5,
          child: ProductForm(product: product)),
    );
  }
}

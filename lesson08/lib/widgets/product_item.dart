import 'package:flutter/material.dart';
import 'package:lesson08/models/product_model.dart';
import 'package:lesson08/widgets/product_popup.dart';

const kLeadingText = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w300,
  color: Colors.blue,
);
const kTrailingText = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w400,
  color: Colors.black87,
);

class ProductItem extends StatelessWidget {
  final ProductModel product;
  const ProductItem({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            backgroundColor: const Color(0x00ffffff),
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return ProductPopup(
                product: product,
              );
            });
      },
      child: ListTile(
        leading: Text(
          product.productName,
          style: kLeadingText,
        ),
        title: Text(
          product.price.toStringAsFixed(2),
          style: kTrailingText,
          textAlign: TextAlign.right,
        ),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}

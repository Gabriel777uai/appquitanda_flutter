import 'package:appquitanda_flutter/src/config/custom_colors.dart';
import 'package:appquitanda_flutter/src/models/item_model.dart';
import 'package:appquitanda_flutter/src/pages/product/product_screen.dart';
import 'package:appquitanda_flutter/src/services/util_services.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ItemTitle extends StatelessWidget {
  final ItemModel item;

  ItemTitle({super.key, required this.item});

  final UtilServices utilServices = UtilServices();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //conteudo do card
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (c) {
                  return  const ProductScreen();
                }
              ),
            );
          },
          child: Card(
            elevation: 2,
            shadowColor: Colors.grey.shade300,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //imagem
                  Expanded(child: Image.asset(item.img)),
          
                  //nome
                  Text(
                    item.itemName,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
          
                  //preco - unidade
                  Row(
                    children: [
                      Text(
                        UtilServices().priceToCurrency(item.price),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: CustomColors.customSwatchColor,
                        ),
                      ),
                      Text(
                        "/${item.unit}",
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 4,
          right: 4,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              height: 40,
              width: 35,
              decoration: BoxDecoration(
                color: CustomColors.customSwatchColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: const Icon(
                Icons.add_shopping_cart,
                color: Colors.white,
                size: 20,
            
              ),
            ),
          ),
        ),
      ],
    );
  }
}

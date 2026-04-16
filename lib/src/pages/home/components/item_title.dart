import 'package:Greengrocer/src/config/custom_colors.dart';
import 'package:Greengrocer/src/models/item_model.dart';
import 'package:Greengrocer/src/pages/product/product_screen.dart';
import 'package:Greengrocer/src/services/util_services.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ItemTitle extends StatefulWidget {
  final ItemModel item;
  final void Function(GlobalKey) cartAnimationMethod;

  const ItemTitle({super.key, required this.item, required this.cartAnimationMethod});

  @override
  State<ItemTitle> createState() => _ItemTitleState();
}

class _ItemTitleState extends State<ItemTitle> {
  final GlobalKey imageGk = GlobalKey();

  final UtilServices utilServices = UtilServices();

  IconData titleIcon = Icons.add_shopping_cart;

  Future<void> switchIcon() async {
    setState(() => titleIcon = Icons.check);

    await Future.delayed(const Duration(milliseconds: 2000));

    setState(() => titleIcon = Icons.add_shopping_cart);

  }

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
                  return ProductScreen(item: widget.item);
                },
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
                  Expanded(
                    child: Hero(
                      tag: widget.item.img,
                      child: Image.asset(widget.item.img, key: imageGk),
                    ),
                  ),

                  //nome
                  Text(
                    widget.item.itemName,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),

                  //preco - unidade
                  Row(
                    children: [
                      Text(
                        UtilServices().priceToCurrency(widget.item.price),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: CustomColors.customSwatchColor,
                        ),
                      ),
                      Text(
                        "/${widget.item.unit}",
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
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Material(
              child: InkWell(
                onTap: () {
                  switchIcon();
                  widget.cartAnimationMethod(imageGk);
                },
                child: Ink(
                  height: 40,
                  width: 35,
                  decoration: BoxDecoration(
                    color: CustomColors.customSwatchColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: Icon(
                    titleIcon,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:appquitanda_flutter/src/config/custom_colors.dart';
import 'package:appquitanda_flutter/src/models/cart_item_model.dart';
import 'package:appquitanda_flutter/src/pages/comom_widgets/quantity_whidget.dart';
import 'package:appquitanda_flutter/src/services/util_services.dart';
import 'package:flutter/material.dart';

class CartTitle extends StatefulWidget {
  final CartItemModel cartItem;
  final Function(CartItemModel) remove;
  const CartTitle({
    super.key,
    required this.cartItem,
    required this.remove
  });

  @override
  State<CartTitle> createState() => _CartTitleState();
}

class _CartTitleState extends State<CartTitle> {
  final UtilServices utilServices = UtilServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10,10,10,0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16)
      ),
      child: ListTile(
        //image
        leading: Image.asset(
          widget.cartItem.item.img,
          width: 60,
          height: 60,
        ),
        // title
        title: Text(widget.cartItem.item.itemName, style: TextStyle(
          fontWeight: FontWeight.w500,
        )),

        //total
        subtitle: Text(utilServices.priceToCurrency(widget.cartItem.totalPrice()), style: TextStyle(
          color: CustomColors.customSwatchColor,
          fontWeight: FontWeight.bold
        )),

        // btm quantidade
        trailing: QuantityWhidget(
          value: widget.cartItem.quantity,
          suffixText: widget.cartItem.item.unit,
          isRemoveble: true,
          result: (quantity) {
            setState(() {
              widget.cartItem.quantity = quantity;
              if (quantity == 0) {
                // remover ite do carrinho
                widget.remove(widget.cartItem);
              }
            });
          }
        ),
      ),
    );
  }
}
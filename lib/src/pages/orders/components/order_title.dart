import 'package:appquitanda_flutter/src/config/custom_colors.dart';
import 'package:appquitanda_flutter/src/models/order_model.dart';
import 'package:appquitanda_flutter/src/services/util_services.dart';
import 'package:flutter/material.dart';

class OrderTitle extends StatelessWidget {
  final OrderModel order;
  OrderTitle({super.key, required this.order});
  final UtilServices utilServices = UtilServices();
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Pedido: ${order.id}", style: TextStyle(
                color: CustomColors.customSwatchColor,
              )),
              Text(utilServices.formatDateTime(order.createDateTime), style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              )),

            ],
          ),
          children: [
            SizedBox(
              height: 150,
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: ListView(
                      children: order.items.map((orderItem) {
                        return Row(
                          children: [
                            Text("${orderItem.quantity} ${orderItem.item.unit} ", style:   TextStyle(
                               fontWeight: FontWeight.bold
                              ),
                            ),
                            Expanded(child: Text(orderItem.item.itemName)),
                            Text(utilServices.priceToCurrency(orderItem.totalPrice()))

                          ],
                        );
                      }).toList(),
                    ),
                  ),
              
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.blue
                    )
                  )
                ],
              ),
            ),
          ],
        
        ),
      ),
    );
  }
}
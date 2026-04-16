import 'package:Greengrocer/src/config/custom_colors.dart';
import 'package:Greengrocer/src/models/cart_item_model.dart';
import 'package:Greengrocer/src/models/order_model.dart';
import 'package:Greengrocer/src/pages/comom_widgets/payment_dialog.dart';
import 'package:Greengrocer/src/pages/orders/components/order_status_widget.dart';
import 'package:Greengrocer/src/services/util_services.dart';
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
          expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
          initiallyExpanded: order.status == "pending_payment",
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
            IntrinsicHeight(
              child: Row(
                children: [
              
                  //List products
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      height: 150,
                      child: ListView(
                        
                        children: order.items.map((orderItem) {
                          return _OrderItemWidget(utilServices: utilServices, orderItem: orderItem);
                        }).toList(),
                      ),
                    ),
                  ),
                  // Divider
              
                  VerticalDivider(
                    color: Colors.grey.shade300,
                    thickness: 2,
                    width: 8,
                  ),
              
              
                  //Status of product
                  Expanded(
                    flex: 2,
                    child: OrderStatusWidget(
                      isOverdue: order.overduDateTime.isBefore(DateTime.now()),
                      status: order.status,
                    ),
                  )
               
                ],
              ),
            ),
              //total
              Text.rich(
                TextSpan(
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                  children: [
                    
                    const TextSpan(
                      text: "Total ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: utilServices.priceToCurrency(order.total),
                    ),
                  ]
                )
              ),

              //Botao payment
              Visibility(
                visible: order.status == "pending_payment",
                child: ElevatedButton.icon(
                  
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    )
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) {
                        return PaymentDialog(order: order,);
                      }
                    );
                  },
                  icon: Icon(Icons.pix),
                  label: const Text("Ver QR code pix"),
                ),
              ),

          ],
        ),
      ),
    );
  }
}

class _OrderItemWidget extends StatelessWidget {

  const _OrderItemWidget({
    required this.utilServices,
    required this.orderItem,
  });

  final UtilServices utilServices;
  final CartItemModel orderItem;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text("${orderItem.quantity} ${orderItem.item.unit} ", style:   TextStyle(
             fontWeight: FontWeight.bold
            ),
          ),
          Expanded(child: Text(orderItem.item.itemName)),
          Text(utilServices.priceToCurrency(orderItem.totalPrice()))
      
        ],
      ),
    );
  }
}
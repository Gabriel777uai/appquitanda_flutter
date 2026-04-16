import 'package:Greengrocer/src/models/order_model.dart';
import 'package:Greengrocer/src/services/util_services.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';


class PaymentDialog extends StatelessWidget {

  final OrderModel order;
  PaymentDialog({super.key, required this.order});
  final UtilServices utilServices = UtilServices();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              
              children: [
                //Title
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text('Pagamento com pix', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  )),
                ),
            
                //Qr code
                QrImageView(
                  data: '1234567890csacsacsasc',
                  version: QrVersions.auto,
                  size: 200.0,
                ),
            
                //Vencimento
                Text("venciemento: ${utilServices.formatDateTime(order.overduDateTime)}", style: const TextStyle(
                  fontSize: 12,
                )),
            
                //Total
                Text("Total: ${utilServices.priceToCurrency(order.total)}", style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold
                )),
            
                //CopiaCola
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
          
                    ),
                    side: const BorderSide(
                      width: 2,
                      color: Colors.green
                    )
                  ),
                  icon: Icon(Icons.copy, size: 15,),
                  onPressed: () {},
                  label: const Text("Copiar código Pix", style: TextStyle(
          
                  )),
                )
            
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.close),
            )
          )
        ],
      ),
    );
  }
}
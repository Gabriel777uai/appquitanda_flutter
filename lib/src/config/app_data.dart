import 'package:Greengrocer/src/models/cart_item_model.dart';
import 'package:Greengrocer/src/models/item_model.dart';
import 'package:Greengrocer/src/models/order_model.dart';
import 'package:Greengrocer/src/models/user_model.dart';

ItemModel apple = ItemModel(
  itemName: "Maçã",
  img: "assets/fruits/maca.png",
  description:
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor, nisl eget ultricies lacinia, nunc nisl aliquam nisl, eget aliquam nunc nisl eget nunc.",
  price: 2.99,
  unit: "kg",
);
ItemModel guava = ItemModel(
  itemName: "Goiaba",
  img: "assets/fruits/guava.png",
  description:
      "lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor, nisl eget ultricies lacinia, nunc nisl aliquam nisl, eget aliquam nunc nisl eget nunc.",
  price: 2.99,
  unit: "kg",
);
ItemModel grape = ItemModel(
  itemName: "Uvas",
  img: "assets/fruits/uvas.png",
  description:
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor, nisl eget ultricies lacinia, nunc nisl aliquam nisl, eget aliquam nunc nisl eget nunc.",
  price: 2.99,
  unit: "kg",
);
ItemModel kiwi = ItemModel(
  itemName: "Kiwi",
  img: "assets/fruits/kiwi.png",
  description:
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor, nisl eget ultricies lacinia, nunc nisl aliquam nisl, eget aliquam nunc nisl eget nunc.",
  price: 2.99,
  unit: "Un",
);
ItemModel mango = ItemModel(
  itemName: "Manga",
  img: "assets/fruits/manga.png",
  description:
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor, nisl eget ultricies lacinia, nunc nisl aliquam nisl, eget aliquam nunc nisl eget nunc.",
  price: 2.99,
  unit: "kg",
);
ItemModel papayaga = ItemModel(
  itemName: "Mamão",
  img: "assets/fruits/mamao.png",
  description:
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor, nisl eget ultricies lacinia, nunc nisl aliquam nisl, eget aliquam nunc nisl eget nunc.",
  price: 2.99,
  unit: "kg",
);

List<ItemModel> items = [apple, guava, grape, kiwi, mango, papayaga];

List<String> categories = [
  "Frutas",
  "Grãos",
  "Verduras",
  "Temperos",
  "Cereais",
];

List<CartItemModel> cartItems = [
  CartItemModel(item: apple, quantity: 2),
  CartItemModel(item: mango, quantity: 3),
  CartItemModel(item: guava, quantity: 1),
];

UserModel user = UserModel(name: "Gabriel", email: "gsb4665004@gmail.com", phone: "62 9 9832-6448", cpf: "999.999.999-99", password: "123456789");

List<OrderModel> orders =
[
  OrderModel(
    id: "c1sa32c1as21",
    createDateTime: DateTime.parse("2026-06-08 00:00:00.00"),
    overduDateTime: DateTime.parse("2026-06-08 11:30:00.00"),
    items: [
      CartItemModel(item: apple, quantity: 2),
      
    ],
    status: "pending_payment",
    copyAndPaste: "ncajsdncjs",
    total: 5.98
  ),
  OrderModel(
    id: "23321csa1c",
    createDateTime: DateTime.parse("2026-12-01 00:00:00.00"),
    overduDateTime: DateTime.parse("2026-12-01 11:30:00.00"),
    items: [
      CartItemModel(item: apple, quantity: 2),
      CartItemModel(item: mango, quantity: 2),
    ],
    status: "delivered",
    copyAndPaste: "ca1s2c13ac1sa",
    total: 11.96
  ),
];
import 'package:appquitanda_flutter/src/models/item_model.dart';

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
  unit: "kg",
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

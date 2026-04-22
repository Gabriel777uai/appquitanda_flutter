import 'package:Greengrocer/src/pages/comom_widgets/app_name_widget.dart';
import 'package:Greengrocer/src/pages/comom_widgets/custom_shimmer.dart';
import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:add_to_cart_animation/add_to_cart_icon.dart';
import 'package:Greengrocer/src/config/custom_colors.dart';
import 'package:Greengrocer/src/pages/home/components/category_title.dart';
import 'package:Greengrocer/src/pages/home/components/item_title.dart';
import 'package:Greengrocer/src/services/util_services.dart';
import 'package:flutter/material.dart';

import 'package:Greengrocer/src/config/app_data.dart' as app_data;


class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String selectedCategory = "Frutas";

  GlobalKey<CartIconKey> globalKey = GlobalKey<CartIconKey>();
  late Function(GlobalKey) runAddToCartAnimation;


  void itemSelectedCartAnimations(GlobalKey gkImage) {
    runAddToCartAnimation(gkImage);
  }

  final UtilServices utilServices = UtilServices();

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      //app bar
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        centerTitle: true,
        title: GestureDetector(
          onTap: () {
            utilServices.showToast(message: "Olá mundo!", isError: false);
          },
          child: AppNameWidget(),
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 15),
            child: GestureDetector(
              onTap: () {},
              child: Badge(
                label: const Text(
                  "2",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                child: AddToCartIcon(
                  key: globalKey,
                  icon: Icon(
                    Icons.shopping_cart,
                    color: CustomColors.customSwatchColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      // campo pesquisa
      body: AddToCartAnimation(
        gkCart: globalKey,
        previewDuration: const Duration(microseconds: 100),
        previewCurve: Curves.ease,
        receiveCreateAddToCardAnimationMethod: (addToCartAnimationMethod) {
          runAddToCartAnimation = addToCartAnimationMethod;
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  isDense: true,
                  hintText: "Pesquise aqui...",
                  hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                  prefixIcon: Icon(
                    Icons.search,
                    color: CustomColors.customColors,
                    size: 21,
                    fontWeight: FontWeight.w800,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(60),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                ),
              ),
            ),
        
            //categorias
            Container(
              padding: const EdgeInsets.only(left: 20),
              height: 40,
              child: !isLoading ? ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return CategoryTitle(
                    onPressed: () {
                      setState(() {
                        selectedCategory = app_data.categories[index];
                      });
                    },
                    category: app_data.categories[index],
                    isSelected: app_data.categories[index] == selectedCategory,
                  );
                },
                separatorBuilder: (_, index) => const SizedBox(width: 10),
                itemCount: app_data.categories.length,
              ) : GridView.count(
                padding: const EdgeInsets.fromLTRB(01, 0, 16, 16),
                physics: const BouncingScrollPhysics(),
                crossAxisCount: 1,
                children: List.generate(
                  5,
                  (index) => CustomShimmer(
                    height: double.infinity,
                    width: double.infinity,
                    
                  )
                ),
                
              )
            ),
        
            //grid produtos
            Expanded(
              child: !isLoading ? GridView.builder(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 9 / 11.5,
                ),
                itemCount: app_data.items.length,
                itemBuilder: (_, index) {
                  return ItemTitle(
                    item: app_data.items[index],
                    cartAnimationMethod: itemSelectedCartAnimations
                  );
                },
              ) : GridView.count(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                physics: const BouncingScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 9 / 11.5,
                children: List.generate(
                  10,
                  (index) => CustomShimmer(
                    height: double.infinity,
                    width: double.infinity,
                    borderRadius: BorderRadius.circular(20),
                  )
                ),
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}
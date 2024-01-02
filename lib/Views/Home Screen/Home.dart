import 'package:emart_app/Controller/HomeConttroller.dart';
import 'package:emart_app/Views/Cart%20Screen/CartScreen.dart';
import 'package:emart_app/Views/Categoary%20Screen/CategoryScreen.dart';
import 'package:emart_app/Views/Home%20Screen/HomeScreen.dart';
import 'package:emart_app/Views/Profile%20Screen/ProfileScreen.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    var navbarItem = [
      BottomNavigationBarItem(
          icon: Image.asset(icHome, width: 26), label: home),
      BottomNavigationBarItem(
          icon: Image.asset(icCategories, width: 26), label: Category),
      BottomNavigationBarItem(
          icon: Image.asset(icCart, width: 26), label: cart),
      BottomNavigationBarItem(
          icon: Image.asset(icProfile, width: 26), label: account),
    ];
    var navBody = [
      HomeScreen(),
      CategoaryScreen(),
      CartScreen(),
      ProfileScreen(),
    ];
    return Scaffold(
      body: Column(
        children: [
          Obx(() => Expanded(
              child: navBody.elementAt(controller.ContNavIndex.value))),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.ContNavIndex.value,
          selectedItemColor: yelloColor,
          selectedLabelStyle: TextStyle(fontFamily: semibold),
          type: BottomNavigationBarType.fixed,
          backgroundColor: whiteColor,
          items: navbarItem,
          onTap: (value) {
            controller.ContNavIndex.value = value;
          },
        ),
      ),
    );
  }
}

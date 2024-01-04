import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/Controller/AuthController.dart';
import 'package:emart_app/Controller/ProfileController.dart';
import 'package:emart_app/Views/AutyhScreen/LoginScreen.dart';
import 'package:emart_app/Views/Profile%20Screen/Components/DetailsCart.dart';
import 'package:emart_app/Views/Services/FirestoreServices.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/firebaseConst.dart';
import 'package:emart_app/consts/list.dart';
import 'package:emart_app/widgetsCommon/BgWidget.dart';

import 'EditProfileScreen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());

    return BgWidget(
      child: Scaffold(
          body: StreamBuilder(
              stream: FirestoreServices.getUser(currentUser!.uid),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(yelloColor),
                    ),
                  );
                } else {
                  var data = snapshot.data!.docs[0];

                  return SafeArea(
                      child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                            alignment: Alignment.topRight,
                            child: Icon(
                              Icons.edit,
                              color: whiteColor,
                            )).onTap(() {
                          controller.nameController.text = data['name'];

                          Get.to(() => EditProfileScreen(data: data));
                        }),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: [
                            data['imageUrl'] == ''
                                ? Image.asset(
                                    imgProfile2,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  ).box.roundedFull.clip(Clip.antiAlias).make()
                                : Image.network(
                                    data['imageUrl'],
                                    width: 100,
                                    fit: BoxFit.cover,
                                  ).box.roundedFull.clip(Clip.antiAlias).make(),
                            10.widthBox,
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "${data['name']}"
                                    .text
                                    .white
                                    .fontFamily(semibold)
                                    .make(),
                                "${data['email']}".text.white.make(),
                              ],
                            )),
                            OutlinedButton(
                              onPressed: () async {
                                await Get.put(AuthController())
                                    .SignOutMethod(context);
                                Get.offAll(() => LoginScreen());
                              },
                              child: "Logout"
                                  .text
                                  .white
                                  .fontFamily(semibold)
                                  .make(),
                              style: OutlinedButton.styleFrom(
                                  side: BorderSide(color: whiteColor)),
                            )
                          ],
                        ),
                      ),
                      20.heightBox,
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            DetailsCart(
                                count: data['cart_count'],
                                title: "In Your Cart",
                                width: context.screenWidth / 3.4),
                            DetailsCart(
                                count: data['wishlist_count'],
                                title: "In Your Wishlist",
                                width: context.screenWidth / 3.4),
                            DetailsCart(
                                count: data['order_count'],
                                title: "Your Orders",
                                width: context.screenWidth / 3.4),
                          ]),

                      // Buttons Section
                      ListView.separated(
                        shrinkWrap: true,
                        itemCount: ProfileButtonList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                              leading: Image.asset(
                                ProfileButtonIcon[index],
                                width: 22,
                              ),
                              title: ProfileButtonList[index]
                                  .text
                                  .fontFamily(semibold)
                                  .color(darkFontGrey)
                                  .make());
                        },
                        separatorBuilder: (context, index) {
                          return Divider(
                            color: lightGrey,
                          );
                        },
                      )
                          .box
                          .padding(EdgeInsets.symmetric(horizontal: 16))
                          .white
                          .rounded
                          .shadowSm
                          .margin(EdgeInsets.all(12))
                          .make()
                          .box
                          .color(redolor)
                          .make(),
                    ],
                  ));
                }
              })),
    );
  }
}

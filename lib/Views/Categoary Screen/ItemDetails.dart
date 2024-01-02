import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/list.dart';
import 'package:emart_app/widgetsCommon/ButtonComm.dart';

class ItemDetails extends StatelessWidget {
  final String? title;
  const ItemDetails({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        title: title!.text.color(darkFontGrey).fontFamily(bold).make(),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.share,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_outline,
              )),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: EdgeInsets.all(8),
            child: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VxSwiper.builder(
                    autoPlay: true,
                    height: 350,
                    aspectRatio: 16 / 9,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        imgFc5,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      );
                    }),
                10.heightBox,

                // title and detail section
                title!.text
                    .color(darkFontGrey)
                    .size(16)
                    .fontFamily(semibold)
                    .make(),
                10.heightBox,
                // ratings
                VxRating(
                  onRatingUpdate: (value) {},
                  normalColor: textfieldGrey,
                  selectionColor: golden,
                  count: 5,
                  size: 25,
                  stepInt: true,
                ),
                10.heightBox,
                "\$30,000".text.color(redolor).fontFamily(bold).size(18).make(),
                10.heightBox,
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "Seller".text.fontFamily(semibold).white.make(),
                        5.heightBox,
                        "In House Brands"
                            .text
                            .color(darkFontGrey)
                            .size(16)
                            .fontFamily(semibold)
                            .make(),
                      ],
                    )),
                    CircleAvatar(
                      backgroundColor: whiteColor,
                      child: Icon(
                        Icons.message_rounded,
                        color: darkFontGrey,
                      ),
                    )
                  ],
                )
                    .box
                    .height(60)
                    .padding(EdgeInsets.symmetric(horizontal: 16))
                    .color(textfieldGrey)
                    .make(),
                20.heightBox,

                // color section
                Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: "Color: ".text.color(textfieldGrey).make(),
                        ),
                        Row(
                            children: List.generate(
                                3,
                                (index) => VxBox()
                                    .size(40, 40)
                                    .roundedFull
                                    .color(Vx.randomPrimaryColor)
                                    .margin(EdgeInsets.symmetric(horizontal: 4))
                                    .make())),
                      ],
                    ).box.padding(EdgeInsets.all(8)).make(),

                    // Quantity Row
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: "Quantity: ".text.color(textfieldGrey).make(),
                        ),
                        Row(children: [
                          IconButton(
                              onPressed: () {}, icon: Icon(Icons.remove)),
                          "0"
                              .text
                              .color(darkFontGrey)
                              .size(16)
                              .fontFamily(bold)
                              .make(),
                          IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                          10.widthBox,
                          "(0 available )".text.color(textfieldGrey).make()
                        ]),
                      ],
                    ).box.padding(EdgeInsets.all(8)).make(),

                    // Total Row
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: "Total: ".text.color(textfieldGrey).make(),
                        ),
                        "\$0.00"
                            .text
                            .color(redolor)
                            .fontFamily(bold)
                            .size(16)
                            .make(),
                      ],
                    ).box.padding(EdgeInsets.all(8)).make(),
                  ],
                ).box.white.shadowSm.make(),
                10.heightBox,

                // description Section
                "Description"
                    .text
                    .color(darkFontGrey)
                    .fontFamily(semibold)
                    .make(),
                10.heightBox,
                "This is a sample item and sample Description here... hsuish sfvg dfhfd ghftgjyhgj khgjk gh jmfg ndvx b"
                    .text
                    .color(darkFontGrey)
                    .fontFamily(semibold)
                    .make(),

                ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: List.generate(
                      itemDetailsButtonList.length,
                      (index) => ListTile(
                            title: itemDetailsButtonList[index]
                                .text
                                .color(darkFontGrey)
                                .fontFamily(semibold)
                                .make(),
                            trailing: Icon(Icons.arrow_forward),
                          )),
                ),
                20.heightBox,

                // Product You may LIke Section
                productMayLike.text
                    .color(darkFontGrey)
                    .size(16)
                    .fontFamily(bold)
                    .make(),
                10.heightBox,

// Copied widget from homescreen
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                        6,
                        (index) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  imgP1,
                                  width: 150,
                                  fit: BoxFit.cover,
                                ),
                                10.heightBox,
                                "Hp Pavilion Laptop "
                                    .text
                                    .fontFamily(semibold)
                                    .color(darkFontGrey)
                                    .make(),
                                10.heightBox,
                                "\$600"
                                    .text
                                    .fontFamily(bold)
                                    .color(orange)
                                    .size(16)
                                    .make(),
                              ],
                            )
                                .box
                                .margin(EdgeInsets.symmetric(horizontal: 4))
                                .white
                                .roundedSM
                                .padding(EdgeInsets.all(8))
                                .make()),
                  ),
                )
              ],
            )),
          )),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ButtonComm(
              color: yelloColor,
              onPress: () {},
              textColor: whiteColor,
              title: "Add to Cart",
            ),
          )
        ],
      ),
    );
  }
}

import 'package:emart_app/Views/Home%20Screen/Components/FeaturedButton.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/list.dart';
import 'package:emart_app/widgetsCommon/HomeButtons.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      color: whiteColor,
      width: context.screenWidth,
      height: context.screenHeight,
      child: SafeArea(
          child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 60,
            color: lightGrey,
            child: TextFormField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: whiteColor,
                  hintText: search,
                  hintStyle: TextStyle(color: textfieldGrey)),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  // First Swipper
                  VxSwiper.builder(
                    aspectRatio: 16 / 9,
                    autoPlay: true,
                    height: 200,
                    enlargeCenterPage: true,
                    itemCount: SlidersList.length,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        SlidersList[index],
                        fit: BoxFit.fill,
                      )
                          .box
                          .rounded
                          .clip(Clip.antiAlias)
                          .margin(EdgeInsets.symmetric(horizontal: 8))
                          .make();
                    },
                  ),
                  10.heightBox,

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                        2,
                        (index) => HomeButtons(
                            title: index == 0 ? todaydeal : flashsale,
                            icon: index == 0 ? icTodaysDeal : icFlashDeal,
                            height: context.screenHeight * 0.15,
                            width: context.screenWidth / 2.5,
                            onPress: () {})),
                  ),
                  10.heightBox,

                  // Second Image Swipper
                  VxSwiper.builder(
                    aspectRatio: 16 / 9,
                    autoPlay: true,
                    height: 200,
                    enlargeCenterPage: true,
                    itemCount: SecondSlidersList.length,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        SecondSlidersList[index],
                        fit: BoxFit.fill,
                      )
                          .box
                          .rounded
                          .clip(Clip.antiAlias)
                          .margin(EdgeInsets.symmetric(horizontal: 8))
                          .make();
                    },
                  ),
                  10.heightBox,

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                        3,
                        (index) => HomeButtons(
                            title: index == 0
                                ? Category
                                : index == 1
                                    ? brand
                                    : topseller,
                            icon: index == 0
                                ? icTopCategories
                                : index == 1
                                    ? icBrands
                                    : icTopSeller,
                            height: context.screenHeight * 0.15,
                            width: context.screenWidth / 3.5,
                            onPress: () {})),
                  ),
                  20.heightBox,
                  Align(
                      alignment: Alignment.centerLeft,
                      child: featuredcatogary.text
                          .color(darkFontGrey)
                          .size(18)
                          .fontFamily(semibold)
                          .make()),
                  10.heightBox,

                  // Featured Catogary
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                          3,
                          (index) => Column(
                                children: [
                                  FeaturedButton(
                                      title: FeaturedTitle1[index],
                                      icon: FeaturedImages1[index]),
                                  10.heightBox,
                                  FeaturedButton(
                                      title: FeaturedTitle2[index],
                                      icon: FeaturedImages2[index]),
                                  10.heightBox,
                                ],
                              )).toList(),
                    ),
                  ),
                  20.heightBox,

                  // Featured Product
                  Container(
                    padding: EdgeInsets.all(12),
                    width: double.infinity,
                    decoration: BoxDecoration(color: orange),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        featuredProduct.text.white
                            .fontFamily(bold)
                            .size(18)
                            .make(),
                        10.heightBox,
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                                6,
                                (index) => Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                        .margin(
                                            EdgeInsets.symmetric(horizontal: 4))
                                        .white
                                        .roundedSM
                                        .padding(EdgeInsets.all(8))
                                        .make()),
                          ),
                        )
                      ],
                    ),
                  ),
                  20.heightBox,

                  // third Swipper
                  VxSwiper.builder(
                    aspectRatio: 16 / 9,
                    autoPlay: true,
                    height: 200,
                    enlargeCenterPage: true,
                    itemCount: SlidersList.length,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        SlidersList[index],
                        fit: BoxFit.fill,
                      )
                          .box
                          .rounded
                          .clip(Clip.antiAlias)
                          .margin(EdgeInsets.symmetric(horizontal: 8))
                          .make();
                    },
                  ),
                  20.heightBox,

                  // All Product
                  GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 6,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          mainAxisExtent: 300),
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              imgP5,
                              width: 200,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                            10.heightBox,
                            "Hp Pavilion Laptop "
                                .text
                                .fontFamily(semibold)
                                .color(darkFontGrey)
                                .make(),
                            Spacer(),
                            "\$600"
                                .text
                                .fontFamily(bold)
                                .color(orange)
                                .size(16)
                                .make(),
                          ],
                        )
                            .box
                            .margin(EdgeInsets.symmetric(horizontal: 12))
                            .white
                            .roundedSM
                            .padding(EdgeInsets.all(8))
                            .make();
                      })
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}

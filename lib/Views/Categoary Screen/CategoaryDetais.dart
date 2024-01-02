import 'package:emart_app/Views/Categoary%20Screen/ItemDetails.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/widgetsCommon/BgWidget.dart';

class CategoaryDetails extends StatelessWidget {
  final String? title;
  const CategoaryDetails({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BgWidget(
        child: Scaffold(
      appBar: AppBar(title: title!.text.fontFamily(bold).white.make()),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    6,
                    (index) => "Baby Cloths"
                        .text
                        .fontFamily(semibold)
                        .color(darkFontGrey)
                        .size(12)
                        .makeCentered()
                        .box
                        .rounded
                        .white
                        .size(120, 60)
                        .margin(EdgeInsets.symmetric(horizontal: 4))
                        .make()),
              ),
            ),
            20.heightBox,
            Expanded(
                child: GridView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: 6,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        mainAxisExtent: 250),
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            imgP5,
                            width: 200,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                          10.heightBox,
                          "Hp Pavilion Laptop "
                              .text
                              .fontFamily(semibold)
                              .color(darkFontGrey)
                              .make(),
                          "\$600"
                              .text
                              .fontFamily(bold)
                              .color(orange)
                              .size(16)
                              .make(),
                        ],
                      )
                          .box
                          .outerShadowSm
                          .margin(EdgeInsets.symmetric(horizontal: 12))
                          .white
                          .roundedSM
                          .padding(EdgeInsets.all(8))
                          .make()
                          .onTap(() {
                        Get.to(() => ItemDetails(title: "XYX ITEM"));
                      });
                    }))
          ],
        ),
      ),
    ));
  }
}

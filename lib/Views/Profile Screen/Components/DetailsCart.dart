import 'package:emart_app/consts/consts.dart';

Widget DetailsCart({width, String? count, String? title}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      count!.text.fontFamily(bold).color(darkFontGrey).size(16).make(),
      5.heightBox,
      title!.text.color(darkFontGrey).make(),
      5.heightBox,
    ],
  ).box.padding(EdgeInsets.all(4)).width(width).height(80).rounded.white.make();
}

import 'package:emart_app/consts/consts.dart';

Widget CustomTextField({String? title, String? hint, Controller, isPass}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.size(16).fontFamily(semibold).color(orange).make(),
      5.heightBox,
      TextFormField(
        controller: Controller,
        obscureText: isPass,
        decoration: InputDecoration(
            hintStyle: TextStyle(
              fontFamily: semibold,
              color: textfieldGrey,
            ),
            hintText: hint,
            isDense: true,
            fillColor: lightGrey,
            filled: true,
            border: InputBorder.none,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: yelloColor),
            )),
      ),
      5.heightBox
    ],
  );
}

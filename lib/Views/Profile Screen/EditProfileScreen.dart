import 'dart:io';

import 'package:emart_app/Controller/ProfileController.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/widgetsCommon/ButtonComm.dart';
import 'package:emart_app/widgetsCommon/CustomTextField.dart';

import '../../widgetsCommon/BgWidget.dart';

class EditProfileScreen extends StatelessWidget {
  final dynamic data;
  const EditProfileScreen({Key? key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();
    // controller.nameController.text = data['name'];
    // controller.passController.text = data['password'];
    return BgWidget(
        child: Scaffold(
      appBar: AppBar(),
      body: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            controller.ProfileImgPath.isEmpty
                ? Image.asset(
                    imgProfile2,
                    width: 100,
                    fit: BoxFit.cover,
                  ).box.roundedFull.clip(Clip.antiAlias).make()
                : Image.file(
                    File(controller.ProfileImgPath.value),
                    width: 100,
                    fit: BoxFit.cover,
                  ).box.roundedFull.clip(Clip.antiAlias).make(),
            10.heightBox,
            ButtonComm(
                color: yelloColor,
                onPress: () {
                  controller.changeImage(context);
                },
                textColor: whiteColor,
                title: "Change"),
            20.heightBox,
            CustomTextField(
                Controller: controller.nameController,
                hint: nameHint,
                title: name,
                isPass: false),
            CustomTextField(
                Controller: controller.passController,
                hint: passwordHint,
                title: Password,
                isPass: true),
            20.heightBox,
            controller.isLoading.value
                ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(yelloColor),
                  )
                : SizedBox(
                    width: context.screenWidth - 60,
                    child: ButtonComm(
                        color: yelloColor,
                        onPress: () async {
                          controller.isLoading(true);
                          await controller.uploadProfileImg(context);
                          await controller.uploadProfile(
                              imgUrl: controller.ProfileImgLink,
                              name: controller.nameController.text,
                              password: controller.passController.text);
                          VxToast.show(context, msg: "Updated");
                        },
                        textColor: whiteColor,
                        title: "Save"),
                  ),
          ],
        )
            .box
            .white
            .shadowSm
            .padding(EdgeInsets.all(16))
            .margin(EdgeInsets.only(top: 50, left: 12, right: 12))
            .rounded
            .make(),
      ),
    ));
  }
}

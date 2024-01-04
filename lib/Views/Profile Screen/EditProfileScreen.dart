import 'dart:io';

import 'package:emart_app/Controller/ProfileController.dart';
import 'package:emart_app/Views/Profile%20Screen/ProfileScreen.dart';
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

    return BgWidget(
        child: Scaffold(
      appBar: AppBar(),
      body: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            controller.ProfileImgPath.isEmpty
                ? Image.network(
                    data['imageUrl'],
                    width: 100,
                    fit: BoxFit.cover,
                  ).box.roundedFull.clip(Clip.antiAlias).make()
                : Image.file(
                    File(controller.ProfileImgPath.value),
                    width: 100,
                    fit: BoxFit.cover,
                  ).box.roundedFull.clip(Clip.antiAlias).make(),
            ButtonComm(
                color: yelloColor,
                onPress: () {
                  controller.isLoading(false);
                  controller.changeImage(context);
                },
                textColor: whiteColor,
                title: "Change"),
            CustomTextField(
                Controller: controller.nameController,
                hint: nameHint,
                title: name,
                isPass: false),
            CustomTextField(
                Controller: controller.oldpassController,
                hint: passwordHint,
                title: oldPassword,
                isPass: true),
            CustomTextField(
                Controller: controller.newpassController,
                hint: passwordHint,
                title: newPassword,
                isPass: true),
            10.heightBox,
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
                          // If Profile is not change
                          if (controller.ProfileImgPath.value.isNotEmpty) {
                            await controller.uploadProfileImg(context);
                          } else {
                            controller.ProfileImgLink = data['imageUrl'];
                          }
                          // If Old Pass Match with database
                          if (controller.oldpassController.text ==
                              data['password']) {
                            await controller.changeAuthPass(
                                email: data['email'],
                                password: controller.oldpassController.text,
                                newpassword: controller.newpassController.text);

                            await controller.uploadProfile(
                                imgUrl: controller.ProfileImgLink,
                                name: controller.nameController.text,
                                password: controller.newpassController.text);
                            VxToast.show(context, msg: "Updated");
                            Get.to(() => ProfileScreen());
                          } else {
                            controller.isLoading(false);
                            VxToast.show(context, msg: "Incorrect Password");
                          }
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
            .margin(EdgeInsets.only(top: 30, left: 12, right: 12))
            .rounded
            .make(),
      ),
    ));
  }
}

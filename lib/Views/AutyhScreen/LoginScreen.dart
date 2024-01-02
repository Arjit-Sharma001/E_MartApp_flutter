import 'package:emart_app/Controller/AuthController.dart';
import 'package:emart_app/Views/Home%20Screen/Home.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/list.dart';
import 'package:emart_app/widgetsCommon/AppLogo.dart';
import 'package:emart_app/widgetsCommon/BgWidget.dart';
import 'package:emart_app/widgetsCommon/ButtonComm.dart';
import 'package:emart_app/widgetsCommon/CustomTextField.dart';

import 'SignupScreen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());

    return BgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.1).heightBox,
            AppLogo(),
            10.heightBox,
            "Login to $appname".text.fontFamily(bold).white.size(18).make(),
            15.heightBox,
            Obx(
              () => Column(
                children: [
                  CustomTextField(
                      title: email,
                      hint: emailHints,
                      isPass: false,
                      Controller: controller.emailController),
                  CustomTextField(
                      title: Password,
                      hint: passwordHint,
                      isPass: true,
                      Controller: controller.passwordController),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: forgetpPass.text.make(),
                    ),
                  ),
                  5.heightBox,
                  controller.isLoading.value
                      ? CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(yelloColor),
                        )
                      : ButtonComm(
                          color: yelloColor,
                          title: logIn,
                          textColor: whiteColor,
                          onPress: () async {
                            controller.isLoading(true);

                            await controller.LoginMethod(context: context)
                                .then((value) {
                              if (value != null) {
                                VxToast.show(context, msg: loggedIn);
                                Get.offAll(() => Home());
                              } else {
                                controller.isLoading(false);
                              }
                            });
                          },
                          //  {
                          // Get.to(
                          //   () => Home(),
                          // );
                          // }
                        ).box.width(context.screenWidth - 50).make(),
                  5.heightBox,
                  createNewAcc.text.color(fontGrey).make(),
                  5.heightBox,
                  ButtonComm(
                      color: lightgolden,
                      title: signUp,
                      textColor: yelloColor,
                      onPress: () {
                        Get.to(() => SignupScreen());
                      }).box.width(context.screenWidth - 50).make(),
                  10.heightBox,
                  logInWith.text.color(fontGrey).make(),
                  5.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        3,
                        (index) => Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: lightGrey,
                                child: Image.asset(
                                  SocialIconList[index],
                                  width: 30,
                                ),
                              ),
                            )),
                  ),
                ],
              )
                  .box
                  .white
                  .rounded
                  .padding(EdgeInsets.all(16))
                  .width(context.screenWidth - 70)
                  .shadowSm
                  .make(),
            ),
          ],
        ),
      ),
    ));
  }
}

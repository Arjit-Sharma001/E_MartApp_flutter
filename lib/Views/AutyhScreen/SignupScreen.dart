import 'package:emart_app/Controller/AuthController.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/firebaseConst.dart';

import '../../widgetsCommon/AppLogo.dart';
import '../../widgetsCommon/BgWidget.dart';
import '../../widgetsCommon/ButtonComm.dart';
import '../../widgetsCommon/CustomTextField.dart';
import '../Home Screen/Home.dart';

class SignupScreen extends StatefulWidget {
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool? isCheck = false;
  var controller = Get.put(AuthController());

  // text Controller
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRetypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.1).heightBox,
            AppLogo(),
            10.heightBox,
            "SignUp to $appname".text.fontFamily(bold).white.size(18).make(),
            15.heightBox,
            Obx(
              () => Column(
                children: [
                  CustomTextField(
                      title: name,
                      hint: nameHint,
                      Controller: nameController,
                      isPass: false),
                  CustomTextField(
                      title: email,
                      hint: emailHints,
                      Controller: emailController,
                      isPass: false),
                  CustomTextField(
                      title: Password,
                      hint: passwordHint,
                      Controller: passwordController,
                      isPass: true),
                  CustomTextField(
                      title: retypepassword,
                      hint: passwordHint,
                      Controller: passwordRetypeController,
                      isPass: true),

                  Row(
                    children: [
                      Checkbox(
                          activeColor: orange,
                          checkColor: whiteColor,
                          value: isCheck,
                          onChanged: (newValue) {
                            setState(() {
                              isCheck = newValue;
                            });
                          }),
                      Expanded(
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "I agree to the ",
                              style: TextStyle(
                                  color: fontGrey, fontFamily: regular)),
                          TextSpan(
                              text: TermsAndConditions,
                              style: TextStyle(
                                  color: orange, fontFamily: regular)),
                          TextSpan(
                              text: " & ",
                              style: TextStyle(
                                  color: fontGrey, fontFamily: regular)),
                          TextSpan(
                              text: PrivacyPolicy,
                              style: TextStyle(
                                  color: orange, fontFamily: regular)),
                        ])),
                      )
                    ],
                  ),
                  controller.isLoading.value
                      ? CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(yelloColor),
                        )
                      : ButtonComm(
                          color: isCheck == true ? orange : lightGrey,
                          title: signUp,
                          textColor: isCheck == true ? whiteColor : orange,
                          onPress: () async {
                            if (isCheck != false) {
                              try {
                                VxToast.show(context, msg: "Hello");
                                await controller.SignUpMethod(
                                        context: context,
                                        email: emailController.text,
                                        password: passwordController.text)
                                    .then((value) {
                                  return controller.StoreUserData(
                                      email: emailController.text,
                                      password: passwordController.text,
                                      name: nameController.text);
                                }).then((value) {
                                  VxToast.show(context, msg: loggedIn);
                                  Get.offAll(() => Home());
                                });
                              } catch (e) {
                                auth.signOut();
                                VxToast.show(context, msg: e.toString());
                                controller.isLoading(false);
                              }
                            }
                          }).box.width(context.screenWidth - 50).make(),
                  10.heightBox,

                  // Wrappping in gesturedettector of Velocity X
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      alreadAcc.text.color(fontGrey).make(),
                      logIn.text.color(orange).make(),
                    ],
                  ).onTap(() {
                    Get.back();
                  }),
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

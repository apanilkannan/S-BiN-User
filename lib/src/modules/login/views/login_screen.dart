import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_bin/gen/colors.gen.dart';
import 'package:s_bin/src/common/app_tags.dart';
import 'package:s_bin/src/common/app_utils.dart';
import 'package:s_bin/src/common/prefernce_utils.dart';
import 'package:s_bin/src/common/widgets/app_background.dart';
import 'package:s_bin/src/common/widgets/app_colors.dart';
import 'package:s_bin/src/common/widgets/common_app_bar.dart';
import 'package:s_bin/src/common/widgets/custom_text_field.dart';
import 'package:s_bin/src/common/widgets/round_button.dart';
import 'package:s_bin/src/modules/login/controllers/login_controller.dart';
import 'package:s_bin/src/networking/firebase/auth_service.dart';
import 'package:s_bin/src/routes/app_routes.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: CommonAppBar(
              title: AppTags.appName,
            )),
        body: AppBackground(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                // EMAIL TEXT FORM FIELD
                Padding(
                  padding: const EdgeInsets.only(top: 80.0, bottom: 30),
                  child: CustomTextField(
                    textInputType: TextInputType.emailAddress,
                    hint: AppTags.emailHint,
                    textController: controller.emailController,
                  ),
                ),
                // PASSWORD TEXT FORM FIELD
                CustomTextField(
                  textInputType: TextInputType.name,
                  hint: AppTags.passHint,
                  textController: controller.passwordController,
                ),
                const Spacer(),

                // LOGIN BUTTON

                Obx(
                  () => RoundButton(
                    text: controller.isLoading.value == true
                        ? AppTags.loading
                        : AppTags.login,
                    onClick: () async {
                      if (controller.emailController.text.isNotEmpty &&
                          controller.passwordController.text.isNotEmpty) {
                        controller.isLoading.value = true;
                        final message = await AuthService().login(
                          email: controller.emailController.text,
                          password: controller.passwordController.text,
                        );
                        if (message!.contains('Success')) {
                          PreferenceUtils.setBool('isLogin', true);
                          Get.offAllNamed(AppRoutes.googleMap);
                          AppUtils().showSuccessBar('Successfully Login!');
                          controller.isLoading.value = false;
                        }
                      } else {
                        controller.isLoading.value = false;
                        AppUtils().showErrorBar(
                            'Please Fill All The Required Field!');
                      }
                      controller.isLoading.value = false;
                    },
                  ),
                ),
                Text.rich(
                  TextSpan(
                    text: AppTags.doNtHaveAccount,
                    style: AppTags.font16weight500
                        .copyWith(color: AppColors.verdantGrn),
                    children: [
                      TextSpan(
                          text: AppTags.signUp,
                          style: AppTags.font16weight500.copyWith(
                            color: ColorName.burntSienna,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.toNamed(AppRoutes.signUp);
                            }),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ));
  }
}

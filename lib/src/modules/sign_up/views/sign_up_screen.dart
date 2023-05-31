import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_bin/src/common/app_tags.dart';
import 'package:s_bin/src/common/widgets/app_background.dart';
import 'package:s_bin/src/common/widgets/common_app_bar.dart';
import 'package:s_bin/src/common/widgets/custom_text_field.dart';
import 'package:s_bin/src/common/widgets/round_button.dart';
import 'package:s_bin/src/modules/sign_up/controllers/sign_up_controller.dart';
import 'package:s_bin/src/networking/firebase/auth_service.dart';
import 'package:s_bin/src/networking/firebase/database_service.dart';
import 'package:s_bin/src/routes/app_routes.dart';

class SignUpScreen extends GetView<SignUpController> {
  const SignUpScreen({super.key});

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // NAME TEXT
                const Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text(
                    AppTags.name,
                    style: AppTags.font18weight500,
                  ),
                ),
                // NAME TEXT FORM FIELD
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    bottom: 20,
                  ),
                  child: CustomTextField(
                    textInputType: TextInputType.name,
                    hint: AppTags.nameHint,
                    textController: controller.nameController,
                  ),
                ),
                // EMAIL TEXT
                const Text(
                  AppTags.email,
                  style: AppTags.font18weight500,
                ),
                // EMAIL TEXT FORM FIELD
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 20),
                  child: CustomTextField(
                    textInputType: TextInputType.emailAddress,
                    hint: AppTags.emailHint,
                    textController: controller.emailController,
                  ),
                ),

                // PHONE TEXT
                const Text(
                  AppTags.phone,
                  style: AppTags.font18weight500,
                ),
                // PHONE TEXT FORM FIELD
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 20),
                  child: CustomTextField(
                    textInputType: TextInputType.phone,
                    hint: AppTags.phoneHint,
                    textController: controller.phoneController,
                  ),
                ),

                // PASSWORD TEXT
                const Text(
                  AppTags.password,
                  style: AppTags.font18weight500,
                ),
                // PASSWORD TEXT FORM FIELD
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: CustomTextField(
                    textInputType: TextInputType.name,
                    hint: AppTags.passHint,
                    textController: controller.passwordController,
                  ),
                ),
                const Spacer(),

                // SIGNUP BUTTON
                RoundButton(
                  text: controller.isLoading.value == true
                      ? AppTags.loading
                      : AppTags.signUp,
                  onClick: () async {
                   controller.signUpUser();
                  },
                )
              ],
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/app_padding.dart';
import '../../../core/values/app_styles.dart';
import '../../../core/values/custom_button.dart';
import '../../../shared_widgets/custom_input.dart';
import '../../../shared_widgets/custom_text.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: AppPadding.largePadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Gap(50),
                CustomInput(
                  textEditingController:
                      TextEditingController(), //controller.emailController,
                  hint: 'Name',
                  validator: (value) {
                    return ""; //controller.validateInputEmail(value!);
                  },
                ),
                const Gap(20),
                CustomInput(
                  textEditingController:
                      TextEditingController(), //controller.emailController,
                  hint: 'Email',
                  validator: (value) {
                    return ""; //controller.validateInputEmail(value!);
                  },
                ),
                const Gap(20),
                CustomInput(
                  textEditingController:
                      TextEditingController(), //controller.emailController,
                  hint: 'Password',
                  validator: (value) {
                    return ""; //controller.validateInputEmail(value!);
                  },
                ),
                const Gap(20),
                CustomInput(
                  textEditingController:
                      TextEditingController(), //controller.emailController,
                  hint: 'Confirm Password',
                  validator: (value) {
                    return ""; //controller.validateInputEmail(value!);
                  },
                ),
                const Gap(20),
                CustomButton(
                  onPress: () {
                    // navigateTo(context, SocialRegisterScreen());
                  },
                  title: 'Sign Up',
                ),
              ],
            ),
          ),
        ));
  }
}

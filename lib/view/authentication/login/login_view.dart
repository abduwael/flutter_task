import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/app_padding.dart';
import '../../../core/values/app_styles.dart';
import '../../../core/values/custom_button.dart';
import '../../../shared_widgets/custom_input.dart';
import '../../../shared_widgets/custom_text.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.largePadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: CustomText(
                        textStyle: AppTextStyles.titleBold,
                        text: 'Login Now to Communicate with friends'),
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
                  CustomButton(
                    onPress: () {
                      // navigateTo(context, SocialRegisterScreen());
                    },
                    title: 'Login',
                  ),
                  const Gap(20),
                  CustomText(
                    text: 'New user? Sign up here!',
                    textStyle: AppTextStyles.styleBold,
                  ),
                  TextButton(
                      onPressed: () {
                        // navigateTo(context, SocialRegisterScreen());
                      },
                      child: CustomText(
                        text: 'Sign up',
                        textStyle: AppTextStyles.styleBold.copyWith(
                          color: AppColors.secondaryColor,
                        ),
                      )),
                ],
              ),
            ),
          ),
        ));
  }
}

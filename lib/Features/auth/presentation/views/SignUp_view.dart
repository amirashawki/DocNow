import 'package:docnow_app/Features/auth/presentation/views/widgets/Sign_With_%20Google.dart';
import 'package:docnow_app/Features/auth/presentation/views/widgets/bottom_text.dart';
import 'package:docnow_app/Features/auth/presentation/views/widgets/custom_raw.dart';
import 'package:docnow_app/Features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:docnow_app/Features/auth/presentation/views/widgets/scaffold_auth.dart';
import 'package:docnow_app/Features/auth/presentation/views/widgets/show_email_phone.dart';
import 'package:docnow_app/core/utils/app_color.dart';
import 'package:docnow_app/core/utils/app_images.dart';
import 'package:docnow_app/core/utils/app_router.dart';
import 'package:docnow_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldAuth(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 33),
            Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 24,
                color: AppColor.kprimaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Please enter your information to create a'
              ' new account. ',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 40),

            ShowEmailOrPhone(
              columnEmail: Column(
                children: [
                  SizedBox(height: 42),
                  CustomTextFormField(
                    hintText: 'Full Name',
                    image: Assets.imagesFrame,
                  ),
                  SizedBox(height: 16),
                  CustomTextFormField(
                    hintText: 'Email',
                    image: Assets.imagesCall,
                  ),
                  SizedBox(height: 16),
                  CustomTextFormField(
                    hintText: 'passWord',
                    image: Assets.imagesLock,
                  ),
                  SizedBox(height: 16),
                  CustomTextFormField(
                    hintText: 'Confirm passWord',
                    image: Assets.imagesLock,
                  ),
                ],
              ),
              columnPhone: Column(
                children: [
                  SizedBox(height: 42),
                  CustomTextFormField(
                    hintText: 'Full Name',
                    image: Assets.imagesFrame,
                  ),
                  SizedBox(height: 16),
                  CustomTextFormField(
                    hintText: 'phone',
                    image: Assets.imagesCall,
                  ),
                  SizedBox(height: 16),
                  CustomTextFormField(
                    hintText: 'passWord',
                    image: Assets.imagesLock,
                  ),
                  SizedBox(height: 16),
                  CustomTextFormField(
                    hintText: 'Confirm passWord',
                    image: Assets.imagesLock,
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),

            CustomButton(title: 'Sign Up'),
            SizedBox(height: 24),
            CustomRow(
              text1: 'Already have an account?',
              text2: 'Login',
              onTap: () {
                GoRouter.of(context).pop(AppRouter.kLoginView);
              },
            ),
            SizedBox(height: 24),
            Image.asset(Assets.imagesDivider),
            SizedBox(height: 24),
            SignWithGoogleButton(),
            SizedBox(height: 40),
            BottomText(
              text1: 'By creating an account, you agree to our ',
              text2: 'Terms \n           and Conditions',
              text3: ' and ',
              text4: 'Privacy Policy',
            ),
            SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}

import 'package:docnow_app/Features/auth/presentation/views/widgets/Sign_With_%20Google.dart';
import 'package:docnow_app/Features/auth/presentation/views/widgets/bottom_text.dart';
import 'package:docnow_app/Features/auth/presentation/views/widgets/custom_raw.dart';
import 'package:docnow_app/Features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:docnow_app/Features/auth/presentation/views/widgets/scaffold_auth.dart';
import 'package:docnow_app/Features/auth/presentation/views/widgets/show_email_phone.dart';
import 'package:docnow_app/core/utils/app_color.dart';
import 'package:docnow_app/core/utils/app_images.dart';
import 'package:docnow_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldAuth(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 80),
            Text(
              'Login',
              style: TextStyle(
                fontSize: 24,
                color: AppColor.kprimaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Please log in to your account to continue.'
              'If you havent registered yet, sign up '
              'now and enjoy our features.',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 40),
            ShowEmailOrPhone(),
            SizedBox(height: 42),
            CustomTextFormField(hintText: 'Email', image: Assets.imagesSms),
            SizedBox(height: 16),
            CustomTextFormField(hintText: 'passWord', image: Assets.imagesLock),
            SizedBox(height: 24),
            CustomButton(title: 'Login'),
            SizedBox(height: 24),
            CustomRow(text1: 'Dont have an account?', text2: 'Sign Up'),
            SizedBox(height: 24),
            Image.asset(Assets.imagesDivider),
            SizedBox(height: 24),
            SignWithGoogleButton(),
            SizedBox(height: 40),
            BottomText(),
            SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}

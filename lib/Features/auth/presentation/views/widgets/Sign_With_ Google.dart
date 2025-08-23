
import 'package:docnow_app/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class SignWithGoogleButton extends StatelessWidget {
  const SignWithGoogleButton({
    super.key,

    this.onTap,
    this.borderRadius,
    this.verticalPadding,
  });

  final double? verticalPadding;
  @override
  final double? borderRadius;
  final void Function()? onTap;
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 32),
          border: Border.all(color: Color(0xffB0B0B0)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: verticalPadding ?? 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Assets.imagesGoogle),
              SizedBox(width: 8),
              Text(
                'Sign In With Google',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

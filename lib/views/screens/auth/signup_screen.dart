import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:green_tech_app/getit.dart';
import 'package:green_tech_app/utils/base_view_builder.dart';
import 'package:green_tech_app/utils/color_utils.dart';
import 'package:green_tech_app/utils/form_style.dart';
import 'package:green_tech_app/utils/image_utils.dart';
import 'package:green_tech_app/utils/text_style_utils.dart';
import 'package:green_tech_app/viewModel/auth_view_model.dart';
import 'package:green_tech_app/views/screens/auth/signin_screen.dart';
import 'package:green_tech_app/views/widgets/custom_button.dart';

class SignupScreen extends StatefulWidget {
  static const routeName = 'signup-screen';
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcEEEEEE,
      appBar: AppBar(
        backgroundColor: kcEEEEEE,
        elevation: 0.0,
      ),
      body: BaseViewBuilder<AuthViewModel>(
          model: getIt(),
          builder: (aVm, _) {
            return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 120,
                              width: 120,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                        imgLogo,
                                      ),
                                      fit: BoxFit.cover),
                                  shape: BoxShape.circle),
                            ),
                          ],
                        ),
                      ),
                      TextFormField(
                        controller: aVm.sNameController,
                        validator: aVm.nameValidator,
                        decoration: borderTextInputDecoration.copyWith(
                            hintText: 'Full Name'),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: aVm.sEmailController,
                        validator: aVm.emailValitor,
                        keyboardType: TextInputType.emailAddress,
                        decoration: borderTextInputDecoration.copyWith(
                            hintText: 'Email'),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: aVm.sPhoneController,
                        keyboardType: TextInputType.phone,
                        validator: aVm.phoneValidator,
                        decoration: borderTextInputDecoration.copyWith(
                            hintText: 'Phone Number'),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: aVm.sPasswordController,
                        validator: aVm.passwordValidator,
                        decoration: borderTextInputDecoration.copyWith(
                            hintText: 'Password'),
                        obscureText: true,
                      ),
                      const SizedBox(height: 60),
                      CustomButtonWidget(
                          callback: () {
                            if (!formKey.currentState!.validate()) return;
                            aVm.signupUser(context);
                          },
                          title: 'Sign Up'),
                      Container(
                        alignment: Alignment.bottomCenter,
                        height: 30,
                        color: Colors.transparent,
                        child: RichText(
                          text: TextSpan(
                              text: "Already have an account? ",
                              children: [
                                TextSpan(
                                    text: 'Sign In',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.of(context)
                                            .pushNamed(SigninScreen.routeName);
                                      },
                                    style: st000D0940013.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: kcPrimaryColor)),
                              ],
                              style: st000D0940013),
                        ),
                      ),
                    ],
                  ),
                ));
          }),
    );
  }
}

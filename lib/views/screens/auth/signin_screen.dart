import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:green_tech_app/getit.dart';
import 'package:green_tech_app/utils/base_view_builder.dart';
import 'package:green_tech_app/utils/color_utils.dart';
import 'package:green_tech_app/utils/form_style.dart';
import 'package:green_tech_app/utils/image_utils.dart';
import 'package:green_tech_app/utils/text_style_utils.dart';
import 'package:green_tech_app/viewModel/auth_view_model.dart';
import 'package:green_tech_app/views/screens/auth/signup_screen.dart';
import 'package:green_tech_app/views/widgets/custom_button.dart';

class SigninScreen extends StatefulWidget {
  static const routeName = 'signin-screen';
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
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
                          height: MediaQuery.of(context).size.height * 0.4,
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
                          controller: aVm.lemailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: aVm.emailValitor,
                          decoration: borderTextInputDecoration.copyWith(
                              hintText: 'Email'),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: aVm.lPasswordController,
                          validator: aVm.passwordValidator,
                          decoration: borderTextInputDecoration.copyWith(
                              hintText: 'Password'),
                          obscureText: true,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            child: Transform.translate(
                                offset: const Offset(10, 0),
                                child: const Text(
                                  'Forgot password?',
                                  style: TextStyle(color: Colors.black87),
                                )),
                            onPressed: () {
                              //TODO: Route to forgort password screen
                              print('Pressed');
                            },
                          ),
                        ),
                        const SizedBox(height: 40),
                        CustomButtonWidget(
                            callback: () {
                              if (!formKey.currentState!.validate()) return;
                              aVm.signinUser(context);
                            },
                            title: 'Sign In'),
                        Container(
                          alignment: Alignment.bottomCenter,
                          height: 30,
                          color: Colors.transparent,
                          child: RichText(
                            text: TextSpan(
                                text: "Don't  have an account? ",
                                children: [
                                  TextSpan(
                                      text: 'Sign Up',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.of(context).pushNamed(
                                              SignupScreen.routeName);
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
            }));
  }
}

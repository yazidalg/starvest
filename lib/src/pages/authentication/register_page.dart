import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:starvest/src/components/button_component.dart';
import 'package:starvest/src/components/field_component.dart';
import 'package:starvest/src/controllers/auth_controller.dart';
import 'package:starvest/src/helpers/validation.dart';
import 'package:starvest/src/pages/authentication/widget/bottom_auth_widget.dart';

import 'login_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5FA),
      bottomNavigationBar: BottomAuthWidget(
        title: "Already have an account? ",
        titleButton: "Sign In",
        page: () => Get.off(const LoginPage()),
      ),
      body: Consumer<AuthProvider>(builder: (context, authProvider, child) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(24, 40, 24, 44),
            child: Column(children: [
              SvgPicture.asset("assets/logos/Logo.svg"),
              const SizedBox(height: 15),
              Text(
                "Sign Up for Starvest",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 10),
              Text(
                "Create your account and start to invest",
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(color: const Color(0xff828282)),
              ),
              Form(
                key: authProvider.regisKey,
                child: Column(children: [
                  const SizedBox(height: 20),
                  FieldComponent(
                    icon: Icons.person,
                    hint: "Username",
                    controllerText: authProvider.nameController,
                    obsecureText: false,
                  ),
                  const SizedBox(height: 20),
                  FieldComponent(
                    icon: Icons.email,
                    hint: "Email",
                    controllerText: authProvider.emailController,
                    obsecureText: false,
                  ),
                  const SizedBox(height: 20),
                  FieldComponent(
                    icon: Icons.lock,
                    hint: "Password",
                    controllerText: authProvider.passwordController,
                    obsecureText: true,
                  ),
                  const SizedBox(height: 20),
                  FieldComponent(
                    icon: Icons.lock,
                    hint: "Confirm Password",
                    controllerText: authProvider.confirmController,
                    obsecureText: true,
                  ),
                ]),
              ),
              Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (val) {},
                  ),
                  Text.rich(
                    TextSpan(
                        style: Theme.of(context).textTheme.labelSmall,
                        text: "I agree with ",
                        children: [
                          TextSpan(
                            text: "terms and condition",
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(color: const Color(0xffF98930)),
                          ),
                        ]),
                  )
                ],
              ),
              const SizedBox(height: 20),
              ButtonComponent(
                title: "Signn Up",
                onTap: () => authProvider.regisKey.currentState!.validate()
                    ? authProvider.signUp(
                        authProvider.emailController.text,
                        authProvider.passwordController.text,
                      )
                    : null,
                radius: 12,
                color: 0xffF98930,
              ),
              const SizedBox(height: 20),
              Text(
                "OR",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 20),
              ButtonComponent(
                title: "Continue with Google",
                onTap: () {},
                radius: 12,
                color: 0xffF98930,
              ),
            ]),
          ),
        );
      }),
    );
  }
}

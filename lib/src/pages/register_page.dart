import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:starvest/src/components/button_component.dart';
import 'package:starvest/src/components/field_component.dart';
import 'package:starvest/src/helpers/validation.dart';
import 'package:starvest/src/pages/login_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5FA),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.090,
        alignment: Alignment.center,
        child: RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.labelSmall,
            text: "Already have an account? ",
            children: [
              TextSpan(
                text: "Sign In",
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: const Color(0xffF98930)),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => Get.off(const LoginPage()),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
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
            const SizedBox(height: 20),
            FieldComponent(
              icon: Icons.person,
              hint: "Username",
              controllerText: TextEditingController(text: ""),
              validator: (val) => Validator().usernameValidator(val)!,
              obsecureText: false,
            ),
            const SizedBox(height: 20),
            FieldComponent(
              icon: Icons.email,
              hint: "Email",
              controllerText: TextEditingController(text: ""),
              validator: (val) => Validator().usernameValidator(val)!,
              obsecureText: false,
            ),
            const SizedBox(height: 20),
            FieldComponent(
              icon: Icons.lock,
              hint: "Password",
              controllerText: TextEditingController(text: ""),
              validator: (val) => Validator().usernameValidator(val)!,
              obsecureText: true,
            ),
            const SizedBox(height: 20),
            FieldComponent(
              icon: Icons.lock,
              hint: "Confirm Password",
              controllerText: TextEditingController(text: ""),
              validator: (val) => Validator().usernameValidator(val)!,
              obsecureText: true,
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
              onTap: () {},
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
      ),
    );
  }
}

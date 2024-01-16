import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:starvest/src/components/button_component.dart';
import 'package:starvest/src/components/field_component.dart';
import 'package:starvest/src/helpers/validation.dart';
import 'package:starvest/src/pages/authentication/register_page.dart';
import 'package:starvest/src/pages/authentication/widget/bottom_auth_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAuthWidget(
        title: "Don't have an account? ",
        titleButton: "Sign Up",
        page: () => Get.off(const RegisterPage()),
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
              "Sign In for Starvest",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            Text(
              "Welcome back!",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: const Color(0xff828282)),
            ),
            Text(
              "Ready to continue investing?",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: const Color(0xff828282)),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Column(children: [
              FieldComponent(
                icon: Icons.email,
                hint: "Email",
                controllerText: TextEditingController(text: ''),
                validator: (val) => Validator().emailValidator(val)!,
                obsecureText: false,
              ),
              const SizedBox(height: 20),
              FieldComponent(
                icon: Icons.lock,
                hint: "Password",
                controllerText: TextEditingController(text: ''),
                validator: (val) => Validator().passwordValidator(val)!,
                obsecureText: true,
              ),
              Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (val) {},
                  ),
                  Text(
                    "Remember me",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.black),
                  )
                ],
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot your password?",
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: const Color(0xffF98930),
                          fontWeight: FontWeight.w100,
                        ),
                  ),
                ),
              ),
            ]),
            const SizedBox(height: 45),
            ButtonComponent(
              title: "Sign In",
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starvest/src/components/button_component.dart';
import 'package:starvest/src/components/field_component.dart';
import 'package:starvest/src/controllers/auth_controller.dart';
import 'package:starvest/src/helpers/validation.dart';
import 'package:starvest/src/pages/home_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = AuthController();
    return Scaffold(
      body: Card(
        margin: const EdgeInsets.fromLTRB(16, 67, 16, 67),
        elevation: 12,
        shadowColor: const Color.fromRGBO(0, 0, 0, 0.25),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: ListView(
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 100,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color(0xff6EEDD0),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                      child: Column(children: [
                        Image.asset("assets/logos/Logo.png"),
                        const Text("Welcome"),
                      ]),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Form(
                        key: authController.formKey,
                        child: Column(children: [
                          const Text("Registration"),
                          FieldComponent(
                            icon: Icons.person_2_outlined,
                            hint: "Name",
                            controllerText: authController.nameController,
                            obsecureText: false,
                            validator: (value) =>
                                Validator().usernameValidator(value)!,
                          ),
                          FieldComponent(
                            icon: Icons.email_outlined,
                            hint: "Email",
                            controllerText: authController.emailController,
                            obsecureText: false,
                            validator: (value) =>
                                Validator().emailValidator(value)!,
                          ),
                          FieldComponent(
                            icon: Icons.lock_outline_rounded,
                            hint: "Password",
                            controllerText: authController.passwordController,
                            obsecureText: true,
                            validator: (value) =>
                                Validator().passwordValidator(value)!,
                          ),
                          FieldComponent(
                            icon: Icons.lock_outline_rounded,
                            hint: "Confirm Password",
                            controllerText: authController.confirmController,
                            obsecureText: true,
                            validator: (value) =>
                                Validator().passwordValidator(value)!,
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: false,
                                onChanged: (value) {},
                              ),
                              const Text("I agree with terms and condition"),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: false,
                                onChanged: (value) {},
                              ),
                              const Text("Remember Me"),
                            ],
                          ),
                          ButtonComponent(
                            title: "Register",
                            onTap: () => authController
                                .register(
                                  authController.emailController.text,
                                  authController.passwordController.text,
                                )
                                .whenComplete(() => Get.off(
                                    HomePage(user: authController.user!))),
                          ),
                          const Text("OR"),
                          ButtonComponent(
                            title: "Continue with Google",
                            onTap: () => authController
                                .googleSignIn()
                                .whenComplete(() => Get.off(
                                    HomePage(user: authController.user!))),
                          ),
                        ]),
                      ),
                    ),
                    const Text("Already have an account?"),
                  ]),
            ],
          ),
        ),
      ),
    );
  }
}

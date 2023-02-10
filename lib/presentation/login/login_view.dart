import 'package:flutter/material.dart';
import 'package:task/presentation/common/widgets/app_button.dart';
import 'package:task/presentation/resources/assets_manager.dart';
import 'package:task/presentation/resources/color_manager.dart';
import 'package:task/presentation/resources/route_manager.dart';
import 'package:task/presentation/resources/size_manger.dart';
import 'package:task/presentation/resources/string_manager.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: [
          Positioned(
              right: SizeManager.ns21,
              top: SizeManager.ns95,
              child: Container(
                height: SizeManager.s241,
                width: SizeManager.s241,
                decoration: const BoxDecoration(
                  color: ColorManager.lightBlueOpacity,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(SizeManager.ns7, SizeManager.s7),
                      color: ColorManager.lightBlueOpacity,
                      spreadRadius: SizeManager.s4,
                    )
                  ],
                ),
              )),
          Positioned(
              left: SizeManager.ns54,
              bottom: SizeManager.ns42,
              child: Container(
                height: SizeManager.s181,
                width: SizeManager.s181,
                decoration: const BoxDecoration(
                  color: ColorManager.softYellowOpacity,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(SizeManager.s19, SizeManager.ns10),
                      color: ColorManager.softYellowOpacity,
                      spreadRadius: SizeManager.s7,
                    ),
                  ],
                ),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: SizeManager.s68),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: SizeManager.s174,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    StringManager.login,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const SizedBox(
                  height: SizeManager.s115,
                ),
                Text(
                  StringManager.phoneNumber,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: SizeManager.s18,
                ),
                _getTextField(
                    StringManager.phoneNumberHint, AssetImageManager.mobileIc),
                const SizedBox(
                  height: SizeManager.s39,
                ),
                Text(
                  StringManager.password,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: SizeManager.s18,
                ),
                _getTextField(
                    StringManager.passwordHint, AssetImageManager.lockIc),
                const SizedBox(
                  height: SizeManager.s21,
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      StringManager.forgotPassword,
                      style: Theme.of(context).textTheme.bodySmall,
                    )),
                const SizedBox(
                  height: SizeManager.s51,
                ),
                AppButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(RouteManager.home);
                  },
                  text: StringManager.login,
                ),
                const SizedBox(
                  height: SizeManager.s25,
                ),
                AppButton(
                  onPressed: () {},
                  text: StringManager.signUp,
                  isPrimary: false,
                ),
                const SizedBox(
                  height: SizeManager.s30,
                ),
                Align(
                  alignment: Alignment.center,
                  child: InkWell(
                      onTap: () {},
                      child: Text(
                        StringManager.skip,
                        style: Theme.of(context).textTheme.labelSmall,
                      )),
                ),
                const SizedBox(
                  height: SizeManager.s174,
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }

  Widget _getTextField(
    String hint,
    String icon,
  ) {
    return Row(
      children: [
        Image.asset(
          icon,
          height: 18,
          width: 12,
          color: ColorManager.primaryOpacity,
        ),
        const SizedBox(
          width: 12,
        ),
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              hintText: hint,
            ),
          ),
        ),
      ],
    );
  }
}

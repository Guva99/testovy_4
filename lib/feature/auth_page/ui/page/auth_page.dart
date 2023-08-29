import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:testovy_zadanie4/core/theme/app_color.dart';
import 'package:testovy_zadanie4/core/theme/style.dart';
import 'package:testovy_zadanie4/core/validator/email_validator.dart';
import 'package:testovy_zadanie4/core/widgets/global_snackbar_widget.dart';
import 'package:testovy_zadanie4/feature/app/router/app_path_route.dart';
import 'package:testovy_zadanie4/feature/auth_page/domain/use_cases/login_user.dart';
import 'package:testovy_zadanie4/feature/auth_page/ui/state/auth_page_state.dart';
import 'package:testovy_zadanie4/feature/auth_page/ui/widget/app_text_field_widget.dart';
import 'package:testovy_zadanie4/feature/profile_screen/UI/state/manager.dart';

class AuthenticationScreen extends ConsumerStatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends ConsumerState<AuthenticationScreen> with EmailFormatter {
  final TextEditingController textEditingControllerSignIn = TextEditingController();
  final TextEditingController textEditingControllerPass = TextEditingController();

  final GlobalKey<FormState> _formKeyPhone = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyPass = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final loginUser = ref.read(loginUserUseCaseProvider);
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Container(
           color: AppColors.white,
           child: Padding(
             padding: const EdgeInsets.all(8.0),
             child: Column(
               children: [
                 Form(
                   key: _formKeyPhone,
                   child: AppTextFieldWidget(
                     labelText: 'Логин или почта',
                     inputType: TextInputType.emailAddress,
                     height: 50,
                     textEditingController: textEditingControllerSignIn,
                     validator: emailValidator,
                   ),
                 ),
                 const Divider(
                   height: 20,
                   color: AppColors.grayLight,
                 ),
                 Form(
                   key: _formKeyPass,
                   child: AppTextFieldWidget(
                     labelText: 'Пароль',
                     isPassword: true,
                     inputType: TextInputType.text,
                     height: 50,
                     textEditingController: textEditingControllerPass,
                     validator: (val) {
                       if (val!.isEmpty) {
                         return 'Введите пароль';
                       }
                       return null;
                     },
                   ),
                 ),
               ],
             ),
           ),
         ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final validEmail = _formKeyPhone.currentState?.validate() ?? true;
                    final validPass = _formKeyPass.currentState?.validate() ?? true;
                    if (!validEmail || !validPass) return;
                    final result = await loginUser(
                      PageLoginParams(
                        email: textEditingControllerSignIn.text.trim(),
                        pass: textEditingControllerPass.text.trim(),
                      ),
                    );
                    result.fold((failure) {
                      GlobalSnackBar.show(context, message: 'Ошибка, не правильный пароль или логин');
                    }, (authEntity) {
                      GlobalSnackBar.show(context, message: 'Успешно!', color: AppColors.green);
                      ref.read(authManagerProvider)
                        ..email()
                        ..nick();
                      context.go(AppRoute.homeScreenRoute);
                    });
                  },
                  style: AppButtonStyle.primaryStyleBlue,
                  child: const Text('Войти'),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () async {
                    GlobalSnackBar.show(
                      context,
                      message: 'Функционал в разработке',
                      color: AppColors.purpleBlueLight,
                    );
                  },
                  style: AppButtonStyle.primaryStyleBlue,
                  child: const Text('Зарегистрироваться'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
// ElevatedButton(
// onPressed: () async {
// final result = await loginUser(
// const PageLoginParams(
// email: "test@gmail.com",
// pass: "thisisrlycoolpass",
// ),
// );
// result.fold((failure) {
// print('TOKEN: ${failure}');
//
// }, (authEntity) {
// print('TOKEN: ${authEntity.tokens.refreshToken}');
// });
// },
// child: const Text('отправить запрос'))

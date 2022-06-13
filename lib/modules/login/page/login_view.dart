import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:btsid/lib.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _loginUsernameTextController = TextEditingController();
  final TextEditingController _loginPasswordTextController = TextEditingController();

  final _formKeyLogin = GlobalKey<FormState>();

  late bool errorPassword = false;
  late bool errorUsername = false;
  late String errorMessage = "";

  late bool _passwordLoginVisible = false;

  late bool _isLoading = false;

  var _colorPIN = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(listener: (cLogin, sLogin) async {
      // debugPrint("INI S LOGIN $sLogin");
      if (sLogin is OnSuccessGetAuthLogin) {
        // Navigator.pushNamed(context, routeHomePage, arguments: sLogin.data);
        setState(() {
          _isLoading = false;
        });
      }

      if (sLogin is OnLoadingGetAuthLogin) {
        setState(
          () {
            _isLoading = true;
          },
        );
      }
      if (sLogin is OnErrorGetAuthLogin) {
        setState(() {
          _isLoading = false;
          errorMessage = "Username atau Password salah";
        });
        showLongToast(msg: errorMessage);
      }
    }, builder: (cLogin, sLogin) {
      return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  child: Image.asset(
                    "assets/images/wave/Wave-Top.png",
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Image.asset(
                    "assets/images/wave/Wave-Bottom-Right.png",
                  ),
                ),
                Form(
                  key: _formKeyLogin,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Login",
                        ),
                        AppDimens.verticalSpace12,
                        TextFormField(
                          controller: _loginUsernameTextController,
                          validator: (valueUsername) {
                            if (valueUsername!.isEmpty) {
                              return "Silahkan Masukan Username !";
                            }
                          },
                          decoration: textInputDecoration("Username"),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        AppDimens.verticalSpace12,
                        TextFormField(
                          obscureText: !_passwordLoginVisible,
                          controller: _loginPasswordTextController,
                          validator: (valuePassword) {
                            if (valuePassword!.isEmpty) {
                              return "Silahkan Masukan Password !";
                            }
                          },
                          onTap: () {
                            setState(() {
                              errorPassword = false;
                            });
                          },
                          decoration: textInputDecorationPassword(
                            "Password",
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        AppDimens.verticalSpace12,
                        InkWell(
                          onTap: () {
                            if (_formKeyLogin.currentState!.validate()) {
                              context.read<LoginCubit>().getAuth(
                                    data: AuthLoginModel(
                                      username: _loginUsernameTextController.value.text,
                                      password: _loginPasswordTextController.value.text,
                                    ),
                                  );
                            }
                          },
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.cyan,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: _isLoading
                                  ? const SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 1,
                                        color: Colors.white,
                                      ),
                                    )
                                  : Text(
                                      "Login",
                                      style: textButtonWhite(),
                                    ),
                            ),
                          ),
                        ),
                        AppDimens.verticalSpace12,
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, routeRegisterPage);
                          },
                          child: Text(
                            "Belum Memiliki Akun ?",
                            style: textButtonBlue(),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  InputDecoration textInputDecorationPassword([String labelText = "", String hintText = ""]) {
    return InputDecoration(
      prefixIcon: const Icon(
        Icons.vpn_key,
        size: 20,
      ),
      // fillColor: _isLoading ? Colors.grey : Colors.transparent,
      suffixIcon: IconButton(
        icon: Icon(
          _passwordLoginVisible ? Icons.visibility : Icons.visibility,
          color: _colorPIN,
        ),
        onPressed: () {
          setState(() {
            if (!_passwordLoginVisible == true) {
              setState(() {
                _colorPIN = Colors.cyan;
              });
            } else {
              setState(() {
                _colorPIN = Colors.grey;
              });
            }

            _passwordLoginVisible = !_passwordLoginVisible;
          });
        },
      ),
      labelText: labelText,
      filled: true,
      contentPadding: const EdgeInsets.fromLTRB(19, 0, 0, 0),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(19.5),
        borderSide: const BorderSide(
          color: Color(0xffE9E9E9),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(19.5),
        borderSide: const BorderSide(
          color: Color(0xffE9E9E9),
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(19.5),
        borderSide: const BorderSide(color: Colors.red, width: 1.0),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(19.5),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 1.0,
        ),
      ),
      errorStyle: const TextStyle(
        backgroundColor: Colors.transparent,
        fontSize: 10.0,
        color: Color(0xffFF494A),
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _AuthScreenState();
  }
}

class _AuthScreenState extends State<AuthScreen> {
  var _isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(20),
                width: 200,
                child: Image.asset('assets/images/chat.png'),
              ),
              Card(
                margin: EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Form(
                        child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(labelText: '이메일'),
                          keyboardType: TextInputType.emailAddress,
                          //오타 수정 끄기
                          autocorrect: false,
                          // 대문자로 안 바꿈
                          textCapitalization: TextCapitalization.none,
                          validator: (value) {
                            //유효성 검증: 값이 비어있는 경우, @가 포함되지 않은 경우
                            if (value == null ||
                                value.trim().isEmpty ||
                                !value.contains('@')) {
                              return '이메일을 입력해 주세요';
                            }

                            return null;
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: '비밀번호'),
                          keyboardType: TextInputType.visiblePassword,
                          //입력값 가리기
                          obscureText: true,
                          validator: (value) {
                            //유효성 검증: 값이 비어있는 경우, @가 포함되지 않은 경우
                            if (value == null || value.trim().length < 6) {
                              return '비밀번호는 6자 이상이여야 합니다.';
                            }

                            return null;
                          },
                        ),
                        const SizedBox(height: 12),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer),
                          child: Text(_isLogin ? '로그인' : '회원가입'),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _isLogin = !_isLogin;
                            });
                          },
                          child: Text(_isLogin ? '계정생성' : '이미 계정이 있어요!'),
                        )
                      ],
                    )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

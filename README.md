# my_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Flutter 정리

## Flutter 설정 및 실행

- `F1` 또는 `Ctrl+Shift+P`로 명령어 팔레트를 열고 `Flutter: New Project`로 새 프로젝트 생성

- VScode에서 가상 폰 실행 시키는 방법
  `Ctrl + shift + P`에서 `Flutter: Launch Emulator` 실행

- lib/main.dart 를 실행 시키면 가상 폰에 앱이 실행됨

## 이미지 추가

- 이미지 추가는 파일 추가후, pubspec.yaml에 추가해야함

```yaml
# The following section is specific to Flutter packages.
flutter:
  # The following line ensures that the Material Icons font is
  # included with your application, so that you can use the icons in
  # the material Icons class.
  uses-material-design: true

  # To add assets to your application, add an assets section, like this:
  assets:
    - assets/dice-images/dice-1.png
    - assets/dice-images/dice-2.png
    - assets/dice-images/dice-3.png
    - assets/dice-images/dice-4.png
    - assets/dice-images/dice-5.png
    - assets/dice-images/dice-6.png
```

`Image.asset('assets/dice-images/dice-1.png')`

## Materials

### Tag

- MaterialApp(home:) ~= App()
- Scaffold() ~= layout
  appbar, body,
- Text() :String만 가능 html 태그 context와` 유사
- Container ~= div
- Column ~= div flex flex-col
- Image.asset()

### Style

- Center ~= felx justify:center aline-items:center

### other

'동적$a' == `동적{a}` (JS)

### Stateful Widget

1. initState(): 객체 초기화 시에 실행

2. build(): 위젯에서 처음 빌드 될 때 실행,
   setState() 호출 후 실행

3. dispose(): 위젯 삭제 전에 실행

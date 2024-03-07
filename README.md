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

### Flutter 설정 및 실행

- `F1` 또는 `Ctrl+Shift+P`로 명령어 팔레트를 열고 `Flutter: New Project`로 새 프로젝트 생성

- VScode에서 가상 폰 실행 시키는 방법
  `Ctrl + shift + P`에서 `Flutter: Launch Emulator` 실행

- lib/main.dart 를 실행 시키면 가상 폰에 앱이 실행됨

### 깃 클론 후, flutter 패키지 설정

```
flutter packages get

flutter packages upgrade
```

### dart fix https://dart.dev/tools/dart-fix

dart 수정항목 보기

```
dart fix --dry-run
```

dart 수정 실행

```
dart fix --apply
```

# Flutter 정리

## Dart

### 동기 처리

`async await` `then((value) {})`

```dart
void functionA() async {
  final varA = await functionB();
  functionB().then((res){

  })
}
```

### arrow function

```
(data) {return a};

(data) => a
```

### 탬플릿 리터럴 Template literals

'동적$a' == `동적{a}` (JS)

```
'\$ ${expense.amount.toStringAsFixed(2)}' // $ 33.33
// \$ 로 $표시 그냥은 안됨
//expense.amount의 소수점 2번째 까지만 표시
```

### type지정

`itemData['question_index'] as int`
itmeData라는 객체에서 key값이 'question_index'의 value를 int라고 명시

```
DateTime? _selectedData; // null 일수도 있음을 명시
_selectedData! // null 이 아님을 명시
```

### 이미지 추가

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
```

`Image.asset('assets/dice-images/dice-1.png')`

## Materials

### Class

StatelessWidget

```dart
class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.choseAnswers});
  final List<String> choseAnswers; // 상속 받는 요소 type 정의
  @override
  Widget build(context) {
    return Widget();
  }
}
```

StatefulWidget

```dart
class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}
class _QuizState extends State<Quiz> {
  @override
  Widget build(context) {
    setState() {}
    return Widget();
  }
}
```

### Tag

- MaterialApp(home:) ~= App()
- Scaffold() ~= layout
  appbar, body,
- Text() :String만 가능 html 태그 context와` 유사
  - style : TextStyle()
  - TextAlign : 정렬
- Container ~= div
  - alignment: Alignment.center,
  - decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(100),
    ),
- SizedBox : 위젯 크기 지정용
  - width: int, height: double.infinity, // 최대넓이
  - SingleChildScrollView() ~= overflow: scroll
- ListView //길이를 모르는 리스트에 최적화
  - ListView.builder(itemBuilder: itemBuilder) // scroll 최적화
- Center ~= flex justify-center items-center
- Column ~= flex flex-col
  - mainAxisSize: MainAxisSize.min // 크기만큼 만 기본은 전체 차지
- Row ~= flex flex-row
  - mainAxisSize: MainAxisSize.min // 크기만큼 만 기본은 전체 차지
- Image.asset()
- Padding()
  - padding: const EdgeInsets.all(8.0),
- showModalBottomSheet() : 바텀시트 활성화

  ```dart
    void _openAddExpenseOverlay() {
      showModalBottomSheet(
          context: context, builder: (ctx) => const AddItemSheet());
    }
  ```

- TextField() ~= input

  ```dart
  class _AddItemSheet extends State<AddItemSheet> {
    /*
    var _enteredTitle = '';
    void _saveTitleInput(String inputValue) {
      _enteredTitle = inputValue;
    }
    */

    final _titleController = TextEditingController();
    @override
    void dispose() {
      _titleController.dispose();
      super.dispose();
    }

    @override
    Widget build(BuildContext context) {
      return TextField(
            //onChanged: _saveTitleInput,
            controller: _titleController,
            );
    }
  }
  ```

- 달력

  ```dart
  DateTime? _selectedData;

  void _presentDatePicker() async {
    final nowTime = DateTime.now();
    final firstDate = DateTime(nowTime.year - 1, nowTime.month, nowTime.day);

    final pickedData = await showDatePicker(
        context: context,
        initialDate: nowTime, //
        firstDate: firstDate,
        lastDate: nowTime);
    setState(() {
      _selectedData = pickedData;
    });
  }
  ```

- 드롭다운 버튼

```dart
Category _selectedCategory = Category.leisure;

DropdownButton(
  items: Category.values
      .map(
        (category) => DropdownMenuItem(
          value: category,
          child: Text(
            category.name,
          ),
        ),
      )
      .toList(),
  onChanged: (value) {
    if (value == null) {
      return;
    }
    setState(() {
      _selectedCategory = value;
    });
  },
  value: _selectedCategory,
),
```

- showDialog() AlertDialog() ~= 모달

```dart
showDialog(
  context: context,
  builder: (ctx) => AlertDialog( //
    title: const Text('Invalid input'),
    content: const Text('올바른 입력을 해주세요'),
    actions: [
      TextButton(
          onPressed: () {
            Navigator.pop(ctx);
          }, //
          child: const Text('Okay'))
    ],
  ),
);
```

- Dismissible : 방향(좌우)으로 드래그 해서 적용되는 활동

  ```dart
  Dismissible(
            key: ValueKey(expenses[index]), //
            onDismissed: (direction) {
              onRemoveExpense(expenses[index]);
            },
            child: ExpensesItem(expenses[index]))
  ```

- 스넥바
  ```dart
  ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3), //
        content: Text('삭제완료'), //
        action: SnackBarAction(
          label: '되돌리기',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  ```

### Stateful Widget

1. initState(): 객체 초기화 시에 실행

2. build(): 위젯에서 처음 빌드 될 때 실행,
   setState() 호출 후 실행

3. dispose(): 위젯 삭제 전에 실행

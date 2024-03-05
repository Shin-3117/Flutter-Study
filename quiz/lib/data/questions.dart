import 'package:quiz/models/quiz_question.dart';

const questions = [
  QuizQuestion(
    'flutter UI의 주요 구정 요소는?',
    ['Widgets', 'Components', 'Blocks', 'Functions'],
  ),
  QuizQuestion('Flutter UIs 어떻게 built 되나요?', [
    'By combining widgets in code',
    'By combining widgets in a visual editor',
    'By defining widgets in config files',
    'By using XCode for iOS and Android Studio for Android',
  ]),
  QuizQuestion(
    'StatefulWidget의 목표는?',
    [
      'Update UI as data changes',
      'Update data as UI changes',
      'Ignore data changes',
      'Render UI that does not depend on data',
    ],
  ),
  QuizQuestion(
    'StatelessWidget or StatefulWidget 중 더 사용해야 하는 Widget은?',
    [
      'StatelessWidget',
      'StatefulWidget',
      'Both are equally good',
      'None of the above',
    ],
  ),
  QuizQuestion(
    'StatelessWidget에서 데이터를 변경하면 어떻게 되나요?',
    [
      'The UI is not updated',
      'The UI is updated',
      'The closest StatefulWidget is updated',
      'Any nested StatefulWidgets are updated',
    ],
  ),
  QuizQuestion(
    'StatefulWidgets 내부 data를 변경하는 방법은?',
    [
      'By calling setState()',
      'By calling updateData()',
      'By calling updateUI()',
      'By calling updateState()',
    ],
  ),
];

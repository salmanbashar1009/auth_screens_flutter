// providers/question_option_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/quetion_option_Model.dart';

final questionOptionProvider =
StateNotifierProvider<QuestionOptionNotifier, List<QuestionOption>>((ref) {
  return QuestionOptionNotifier([
    QuestionOption(
      title: 'The pursuit of happiness',
      imageUrls: [
        'https://randomuser.me/api/portraits/men/1.jpg',
        'https://randomuser.me/api/portraits/men/2.jpg',
        'https://randomuser.me/api/portraits/men/8.jpg',
        'https://randomuser.me/api/portraits/men/9.jpg',
        'https://randomuser.me/api/portraits/men/10.jpg',
      ],
    ),
    QuestionOption(
      title: 'I am legend',
      imageUrls: [
        'https://randomuser.me/api/portraits/men/3.jpg',
        'https://randomuser.me/api/portraits/men/4.jpg'
      ],
    ),
    QuestionOption(
      title: 'Men in black',
      imageUrls: [
        'https://randomuser.me/api/portraits/men/5.jpg',
      ],
    ),
  ]);
});

class QuestionOptionNotifier extends StateNotifier<List<QuestionOption>> {
  QuestionOptionNotifier(super.initialState);

  void select(int index) {
    state = [
      for (int i = 0; i < state.length; i++)
        state[i].copyWith(isSelected: i == index)
    ];
  }
}

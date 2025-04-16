class QuestionOption {
  final String title;
  final List<String> imageUrls;
  final bool isSelected;
  QuestionOption({
    required this.title,
    required this.imageUrls,
    this.isSelected = false,
  });

  QuestionOption copyWith({bool? isSelected}) {
    return QuestionOption(
      title: title,
      imageUrls: imageUrls,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

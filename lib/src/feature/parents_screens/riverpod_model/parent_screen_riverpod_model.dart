class ParentScreenRiverPodModel{
  int selectedIndex;
  int acbcd;

  ParentScreenRiverPodModel({this.selectedIndex = 2, this.acbcd = 1123});

  ParentScreenRiverPodModel copyWith({int? selectedIndex, int? asdfasf}) {
    return ParentScreenRiverPodModel(selectedIndex: selectedIndex ?? this.selectedIndex, acbcd: asdfasf ?? this.acbcd);
  }

}
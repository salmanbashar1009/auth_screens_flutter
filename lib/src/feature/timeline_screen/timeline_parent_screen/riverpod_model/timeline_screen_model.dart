import '../../../../model/user_post_model.dart';

class TimelineScreenModel{
  UserPostModel? userPostModel;

  List<Posts>? filteredUserPostModel;

  TimelineScreenModel({this.userPostModel, this.filteredUserPostModel});

  TimelineScreenModel copyWith({UserPostModel? userPostModel, List<Posts>? filteredUserPostModel}){
    return TimelineScreenModel(
        userPostModel: userPostModel ?? this.userPostModel,
      filteredUserPostModel: filteredUserPostModel ?? this.filteredUserPostModel,
    );
  }

}
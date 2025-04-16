import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:possy_app/core/constant/images.dart';
import 'package:possy_app/src/model/user_post_model.dart';
import '../riverpod_model/timeline_screen_model.dart';

final timelineProvider =
    StateNotifierProvider<TimelineProvider, TimelineScreenModel>(
      (ref) => TimelineProvider(),
    );

class TimelineProvider extends StateNotifier<TimelineScreenModel> {
  TimelineProvider() : super(TimelineScreenModel()) {
    fetchUsersPost();
  }

  TextEditingController searchController = TextEditingController();

  /// dummy post
  final Map<String, dynamic> dummyUsersPost = const {
    "posts": [
      {
        "userName": "marilyn.torff",
        "userID":"123abc",
        "postDate": "March 02, 2025",
        "profilePicture": AppImages.male2,
        "caption": "Just living life one sunset at a time. 🌅✨",
        "imagePath": AppImages.birthday,
        "reacts": 1450,
        "comments": 20,
      },
      {
        "userName": "lindsey.septimus",
        "userID":"123abcd",
        "postDate": "2m ago",
        "profilePicture": AppImages.femaleProfilePicture,
        "caption": "Happiness is a perfectly cooked meal. 🍽️😋",
        "imagePath": null,
        "reacts": 1450,
        "comments": 20,
      },
      {
        "userName": "marilyn.torff",
        "userID":"123abc",
        "postDate": "March 11, 2025",
        "profilePicture": AppImages.male2,
        "caption":
            "Dream big, work hard, stay focused, and surround yourself with good energy. 💪",
        "imagePath": AppImages.hillTracking,
        "reacts": 210,
        "comments": 42,
      },
      {
        "userName": "lindsey.septimus",
        "userID":"123abcd",
        "postDate": "2m ago",
        "profilePicture": AppImages.femaleProfilePicture,
        "caption": "Happiness is a perfectly cooked meal. 🍽️😋",
        "imagePath": null,
        "reacts": 1450,
        "comments": 20,
      },
    ],
  };

  /// Fetch User post
  Future<void> fetchUsersPost() async {
    try {
      debugPrint("\nFetching users data.\n");
      UserPostModel? userPostModel = UserPostModel.fromJson(dummyUsersPost);
      state = state.copyWith(userPostModel: userPostModel);
      state = state.copyWith(filteredUserPostModel: state.userPostModel!.posts);
    } catch (error) {
      debugPrint("\nError while fetch user post : $error\n");
    }
  }

  /// searching post
  void onSearch(String searchCommand) {
    try {
      debugPrint("\nSearching posts");
      if (searchCommand.isNotEmpty &&
          (state.userPostModel!.posts != null ||
              state.userPostModel!.posts!.isNotEmpty)) {
        state = state.copyWith(
          filteredUserPostModel:
                state.userPostModel!.posts!
                    .where((post) => post.userName!.toLowerCase().contains(searchCommand) || post.caption!.toLowerCase().contains(searchCommand)).toList(),

        );
      }
      else if(searchCommand.isEmpty){
        state = state.copyWith(filteredUserPostModel: state.userPostModel!.posts);
      }
    } catch (error) {
      debugPrint("\nError while searching post : $error\n");
    }
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/core/constant/images.dart';
import 'package:possy_app/core/constant/padding.dart';
import '../view_model/quwstion_option_provider.dart';
import 'avatar_stack.dart';

class QuestionOptionWidgets extends ConsumerWidget {
  final int index;

  const QuestionOptionWidgets({super.key, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final option = ref.watch(questionOptionProvider)[index];
    TextTheme textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        ref.read(questionOptionProvider.notifier).select(index);
      },
      child: Container(
        padding: EdgeInsets.all(16.w),
        margin: EdgeInsets.only(bottom: 12.h),
        decoration: BoxDecoration(
          color: option.isSelected ? const Color(0xffEDE9FE) : const Color(0xffF5F3FF),
          borderRadius: BorderRadius.all(Radius.circular(16.r)),
          border: Border.all(
            color: option.isSelected ? Colors.deepPurple : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            option.isSelected? Icon(Icons.check_circle, color: Colors.deepPurple, size: 24.r,) : SizedBox(),
            SizedBox(width: 10.w),
            /// Title
            Expanded(
              child: Text(
                option.title,
                style: textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: option.isSelected ? Colors.deepPurple : Colors.black,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 10,
              ),
            ),

            /// people who choose this option (Avatar Stack)
            GestureDetector(
              onTap: (){
                //show bottom sheet
                showSelectorBottomSheet(context, option.imageUrls);
              },
              child: SizedBox(
                height: 40,
                width: 100,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: AvatarStack(
                    imageUrls: option.imageUrls,
                    maxDisplay: 2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showSelectorBottomSheet(BuildContext context, List<String> imageUrls) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(CupertinoIcons.minus,size: 50,),
              SizedBox(height: 10.h),
              ...imageUrls.map((imageUrl) {
                return Container(
                  width: 365.w,
                  padding: AppPadding.screenHorizontalPadding,
                  child: Column(
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: CircleAvatar(
                          radius: 22.r,
                          backgroundImage: NetworkImage(imageUrl),
                        ),
                        title: Row(
                          spacing: 10.w,
                          children: [
                            Text(
                              'Mr. Smith',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            if(imageUrls.first == 'https://randomuser.me/api/portraits/men/1.jpg')
                              Image.asset(AppImages.premiumImage)
                          ],
                        ),
                        onTap: () {
                          Navigator.pop(context, imageUrl);
                        },
                      ),
                      SizedBox(height:16),
                      if(imageUrl.length != imageUrls.last.length)
                        Divider(thickness: 1.5, height: 12.h),
                    ],
                  ),
                );
              }),
              SizedBox(height: 30.h),
            ],
          ),
        );
      },
    );
  }


}

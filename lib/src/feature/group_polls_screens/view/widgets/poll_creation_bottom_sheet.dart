import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/core/constant/icons.dart';
import 'package:possy_app/core/theme/src/theme_extension/color_pallete.dart';
import 'package:possy_app/src/common_widget_style/common_style/auth_style/auth_color_pallete.dart';
import 'package:possy_app/src/common_widget_style/common_style/group_polls_style/group_polls_color_palette.dart';

class PollCreationBottomSheet extends StatefulWidget {
  const PollCreationBottomSheet({super.key});

  @override
  State<PollCreationBottomSheet> createState() => _PollCreationBottomSheetState();
}

class _PollCreationBottomSheetState extends State<PollCreationBottomSheet> {
  final TextEditingController _optionController = TextEditingController();
  final FocusNode _optionFocusNode = FocusNode();
  final FocusNode _keyboardFocus = FocusNode();
  final List<String> _options = [];

  void _addOption() {
    final text = _optionController.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _options.add(text);
      _optionController.clear();
    });

    // Keep focus to avoid keyboard hiding
    FocusScope.of(context).requestFocus(_optionFocusNode);
  }

  @override
  void dispose() {
    _optionController.dispose();
    _optionFocusNode.dispose();
    _keyboardFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final titleMedium = Theme.of(context).textTheme.titleMedium;
    final titleSmall = Theme.of(context).textTheme.titleSmall;
    final bodyLarge = Theme.of(context).textTheme.bodyLarge;

    return Padding(
      padding:  EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom, // Keyboard height
      ),
      child: Container(
        padding:   EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        decoration:  BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40.w,
                  height: 5.h,
                  margin:   EdgeInsets.only(bottom: 16.h),
                  decoration: BoxDecoration(
                    color: GroupPollsColorPalette.grayScale900,
                    borderRadius: BorderRadius.circular(99.r),
                  ),
                ),
              ),
               Row(
                 children: [
                   ImageIcon(AssetImage(AppIcons.horizontalPollBar),color: GroupPollsColorPalette.secondaryOrange,),
                   SizedBox(width: 8.w,),

                   Text(
                    "Poll Creation",
                    style: titleMedium?.copyWith(
                      color: GroupPollsColorPalette.grayScale900,
                      fontWeight: FontWeight.w400
                    ),
                               ),
                 ],
               ),
               SizedBox(height: 38.h),
               Text("Question", style: bodyLarge?.copyWith(
                 color: GroupPollsColorPalette.grayBlack500,
                 fontWeight: FontWeight.w500
               )),
               SizedBox(height: 18.h),
              TextField(
                decoration: InputDecoration(
                  hintText: "What's your poll about?",
                  hintStyle: titleSmall?.copyWith(
                    color: GroupPollsColorPalette.greyScale500
                  ),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding: EdgeInsets.zero, // Optional: tight padding
                ),
              ),
               SizedBox(height: 32.h),
               Text("Options", style: bodyLarge?.copyWith(
                  color: GroupPollsColorPalette.grayBlack500,
                  fontWeight: FontWeight.w500
              )),
              SizedBox(height: 20.h),
              // ..._options.map((option) => Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 4.0),
              //   // child: Row(
              //   //   children: [
              //   //     const Icon(Icons.radio_button_unchecked, size: 18),
              //   //     const SizedBox(width: 8),
              //   //     Expanded(child: Text(option)),
              //   //   ],
              //   // ),
              // )),
               ...List.generate(_options.length, ((index){
                return _options.isEmpty ? SizedBox() : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(_options[index],style: bodyLarge?.copyWith(
                          color: AppColor.primaryTextColor,
                          fontWeight: FontWeight.w600
                        ),),
                        IconButton(onPressed: (){
                          if(mounted){
                            setState(() {
                              _options.removeAt(index);
                            });
                          }
                          debugPrint('\n\n onTap Delete Icon: item deleted\n\n');
                        }, icon: Icon(Icons.delete,color: Colors.red,))
                      ],
                    ),
                    Divider(color: GroupPollsColorPalette.borderColor,)
                  ],
                );
              })),
              SizedBox(height: 18.h),
              TextField(
                controller: _optionController,
                readOnly: _options.length >= 4 ? true : false,
                focusNode: _optionFocusNode,
                textInputAction: TextInputAction.done,
                onTap: () => _keyboardFocus.requestFocus(),
                onEditingComplete: _addOption,
                decoration: InputDecoration(
                  hintText: _options.length >= 4 ? "Can not add more than 4 options" : "Type and press Enter to add option",
                  hintStyle: titleSmall?.copyWith(
                      color: GroupPollsColorPalette.greyScale500
                  ),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding: EdgeInsets.zero,

                ),
              ),
              const SizedBox(height: 10),

              const SizedBox(height: 32),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Handle create poll logic
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _options.length < 4 ? GroupPollsColorPalette.optionTileBackground : AuthColorPalette.primary,
                    foregroundColor: Colors.black87,
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  child:  Text("Create Poll", style: bodyLarge?.copyWith(
                    color: _options.length < 4 ? GroupPollsColorPalette.grayBlack500 : Colors.white,
                    fontWeight: FontWeight.w500
                  )),
                ),
              ),
               SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
    );
  }
}




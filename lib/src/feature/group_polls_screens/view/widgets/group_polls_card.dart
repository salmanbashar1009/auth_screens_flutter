import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:possy_app/src/feature/group_polls_screens/view/widgets/GroupPollsCardContent.dart';

class GroupPollsCard extends StatelessWidget {
  const GroupPollsCard({super.key});

  @override
  Widget build(BuildContext context) {

    final headlineSmall = Theme.of(context).textTheme.headlineSmall;
    final bodySmall = Theme.of(context).textTheme.bodySmall;

    return Container(
      // padding: EdgeInsets.only(bottom: 24.h,),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r)
      ),
      child: GroupPollsCardContent(headlineSmall: headlineSmall, bodySmall: bodySmall),
    );
  }
}





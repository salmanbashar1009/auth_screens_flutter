import 'package:flutter/material.dart';
import 'package:possy_app/src/feature/group_polls_screens/view/widgets/GroupPollsCardContent.dart';
import 'package:possy_app/src/feature/group_polls_screens/view/widgets/timeline_label.dart';

class HistoryContent extends StatelessWidget {
  const HistoryContent({
    super.key,
    // required this.headlineSmall,
    // required this.bodySmall,
  });

  // final TextStyle? headlineSmall;
  // final TextStyle? bodySmall;

  @override
  Widget build(BuildContext context) {

    final headlineSmall = Theme.of(context).textTheme.headlineSmall;
    final bodySmall = Theme.of(context).textTheme.bodySmall;

    return Column(
      children: [
        GroupPollsCardContent(headlineSmall: headlineSmall, bodySmall: bodySmall,isInHistory: true,),
        TimelineLabel(label: "yesterday")
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:possy_app/src/feature/home_screen/view/home_body.dart';
import 'package:possy_app/src/feature/home_screen/view/widget/customHeader.dart';

class HomeScreen extends StatefulWidget {
  
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

  
}
class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
        WidgetsBinding.instance.addPostFrameCallback((_) async {
         //  await Future.delayed(Duration(milliseconds: 500));
     // showCustomSheet(context);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffF4F8ED),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomHeaderHome(),
          Expanded(child: HomeBody()),
         
        ],
      ),
    );
  }
}
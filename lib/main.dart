import 'dart:convert';

import 'package:connex_chat/controller/app.dart';
import 'package:connex_chat/data/model/employee.dart';
import 'package:connex_chat/ui/style.dart';
import 'package:connex_chat/ui/view/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'ui/view/home_page.dart';
import 'ui/view/splash_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  App.employee = jsonDecode(await rootBundle.loadString("assets/data/사원_목록_data.json"))['employee'].map<Employee>((e) => Employee.fromJson(e)).toList();

  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: SplashPage(),
        // home: HomePage(),
        home: LoginPage(),
        theme: Style.theme,
      )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  @override
  void initState() {
    App.tab = TabController(length: 3, animationDuration: Duration.zero, vsync: this);


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Stack(
          children: [
            TabBarView(
                controller: App.tab,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  HomePage(), Container(), Container(), Container()
                ]
            ),
            Positioned(left: 0, right: 0, bottom: -600 + 80,child: Transform.scale(

              scaleX: 2.4,
              child: Container(
                width: 600,
                height: 600,
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(offset: const Offset(0, -10), color: Colors.black.withValues(alpha: .04), blurRadius: 10, spreadRadius: 10)],

                  color: Colors.white,),
              ),
            ),
            ),
            Align(alignment: Alignment.bottomCenter, child: Padding(padding: EdgeInsetsGeometry.fromLTRB(16,0,16,10),
              child: TabBar(
                  controller: App.tab,
                  // indicator: BoxDecoration(color: Style.theme.colorScheme.primary, shape: BoxShape.circle),
                  indicatorColor: Style.theme.colorScheme.primary,
                  // indicatorColor: Style.theme.colorScheme.primary,
                  indicatorSize: TabBarIndicatorSize.label,

                  onTap: (value) => App.currentIndex.value = value,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  tabs: [
                    Tab(icon: Container(padding: EdgeInsets.all(6), width: 56, height: 56, child: SvgPicture.asset(App.currentIndex.value == 0 ? "assets/icons/home-fill.svg":"assets/icons/home-outline.svg", colorFilter: ColorFilter.mode(App.currentIndex.value == 0 ? Style.theme.colorScheme.primary : Colors.grey, BlendMode.srcIn, ),width: 24, height: 24 ))  ),
                    Tab(icon: Container(padding: EdgeInsets.all(6), width: 56, height: 56, child: SvgPicture.asset(App.currentIndex.value == 1 ? "assets/icons/chat-dots-fill.svg" : "assets/icons/chat-dots-outline.svg", colorFilter: ColorFilter.mode(App.currentIndex.value == 1 ? Style.theme.colorScheme.primary : Colors.grey, BlendMode.srcIn, ),width: 24, height: 24 ))  ),
                    Tab(icon: Container(padding: EdgeInsets.all(6), width: 56, height: 56, child: SvgPicture.asset(App.currentIndex.value == 2 ? "assets/icons/person-fill.svg" : "assets/icons/person-outline.svg", colorFilter: ColorFilter.mode(App.currentIndex.value == 2 ? Style.theme.colorScheme.primary : Colors.grey, BlendMode.srcIn, ),width: 24, height: 24 ))  ),
                  ]
              ),),)
          ],
        ),
        // body: ,
      ),
    );
  }
}

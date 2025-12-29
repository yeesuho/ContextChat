import 'package:context_chat/ui/style.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController ac = AnimationController(
    vsync: this,
    duration: Duration(seconds: 1),
  );
  late CurvedAnimation animation = CurvedAnimation(
    parent: ac,
    curve: Curves.easeOutCirc,
  );

  @override
  void initState() {
    Future.delayed(Duration(seconds: 1), () => ac.forward());
    super.initState();
  }

  @override
  void dispose() {
    ac.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) =>
          Scaffold(
            body: Stack(
              children: [
                Container(
                  color: Style.theme.primaryColor,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height,
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/simbol/simbol-white.png"),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Transform.translate(
                                offset: Offset(-80 + 80 * animation.value, 0),
                                child: Opacity(
                                  opacity: ac.value,
                                  child: Text(
                                    "Context Chat",
                                    style: TextStyle(color: Colors.white,
                                        fontFamily: "LexendDeca",
                                        fontSize: 34,
                                        fontWeight: FontWeight.bold),

                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(0, 80 - 80 * animation.value),
                        child: Opacity(opacity:ac.value, child: Text(
                          "언제 어디서든 안정적인 근무 환경을 위해",
                          style: TextStyle(color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
    );
  }
}

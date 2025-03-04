import 'package:dribble_design/app/features/animated_icons_pyramid/view/animated_icons_pyramid.dart';
import 'package:dribble_design/app/modules/introduction/view%20/widgets/introduction_text.dart';
import 'package:dribble_design/app/modules/landing_page/view%20/landing_page.dart';
import 'package:dribble_design/shared/repository/route_repository.dart';
import 'package:dribble_design/shared/widgets/common_button.dart';
import 'package:flutter/material.dart';

class IntroductionView extends StatelessWidget {
  const IntroductionView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1B1B1C),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [AnimatedIconsPyramid()],
                ),
              ),
              Expanded(flex: 3, child: IntroductionText()),
              CommonButton(
                  label: "Get started",
                  ontap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LandingPage()),
                    );
                    final route = RouteRepository();
                    route.markIntroSeen();
                  }),
              Container(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

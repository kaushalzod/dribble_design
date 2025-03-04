import 'package:dribble_design/app/modules/add_subscriptions/model/sub_category.dart';
import 'package:dribble_design/app/modules/introduction/view%20/introduction_view.dart';
import 'package:dribble_design/app/modules/landing_page/view%20/landing_page.dart';
import 'package:dribble_design/app/modules/landing_page/viewmodel/landing_vm.dart';
import 'package:dribble_design/app/modules/my_subscriptions_tab/model/subs_detail_model.dart';
import 'package:dribble_design/app/modules/my_subscriptions_tab/viewmodel/my_subscriptions_vm.dart';
import 'package:dribble_design/shared/repository/route_repository.dart';
import 'package:dribble_design/shared/repository/subscription_repository.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(SubCategoryAdapter());
  Hive.registerAdapter(SubsDetailModelAdapter());
  Hive.registerAdapter(SubsTypeAdapter());
  await CategoryRepository.openBox();
  await RouteRepository.openBox();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final route = RouteRepository();
    bool introViewed = route.fetchIntroStatus();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MySubscriptionsVM>(
          create: (context) => MySubscriptionsVM(),
        ),
        ChangeNotifierProvider<LandingVM>(
          create: (context) => LandingVM(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          textTheme: GoogleFonts.redHatDisplayTextTheme(),
        ),
        home: introViewed ? LandingPage() : IntroductionView(),
      ),
    );
  }
}

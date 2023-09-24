import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form/core/constants/app_constants.dart';
import 'package:form/core/constants/app_theme.dart';
import 'package:form/core/routes/routes.dart';
import 'package:form/core/utils/screen_utils.dart';
import 'package:form/providers/home_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Widget Function(BuildContext, Widget?) botToastBuilder = BotToastInit();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: kNavigatorKey,
        title: kAppName,
        theme: AppThemeData.lightThemeData,
        initialRoute: Routes.homeScreen,
        onGenerateRoute: RouteGenerator.generateRoute,
        navigatorObservers: [BotToastNavigatorObserver()],
        builder: (context, child) {
          ScreenUtil.init(context);
          child = botToastBuilder(context, child);
          return child;
        },
      ),
    );
  }
}

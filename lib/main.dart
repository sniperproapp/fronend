import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:sniper_pro/injection.dart';
import 'package:sniper_pro/src/blocProvider.dart';
import 'package:sniper_pro/src/presentation/Messaging/bloc/notificationBloc.dart';
import 'package:sniper_pro/src/presentation/local_notification/local_notification.dart';
import 'package:sniper_pro/src/presentation/pages/admin/Zoom/update/AdminZoomUpdatePage.dart';
import 'package:sniper_pro/src/presentation/pages/admin/category/create/AdminCategoryCreatePage.dart';
import 'package:sniper_pro/src/presentation/pages/admin/category/update/AdminCategoryUpdatePage.dart';
import 'package:sniper_pro/src/presentation/pages/admin/home/AdminHomePage.dart';
import 'package:sniper_pro/src/presentation/pages/admin/product/create/AdminProductCreatePage.dart';
import 'package:sniper_pro/src/presentation/pages/admin/product/list/AdminProducListPage.dart';
import 'package:sniper_pro/src/presentation/pages/admin/product/update/AdminProductUpdatePage.dart';
import 'package:sniper_pro/src/presentation/pages/admin/reporte/adminreportePage.dart';
import 'package:sniper_pro/src/presentation/pages/admin/user/list/AdminUserListPage.dart';
import 'package:sniper_pro/src/presentation/pages/auth/login/LoginPage.dart';
import 'package:sniper_pro/src/presentation/pages/auth/logout/LogoutPage.dart';
import 'package:sniper_pro/src/presentation/pages/auth/recuperarpass/RecuperarpassPage.dart';
import 'package:sniper_pro/src/presentation/pages/auth/register/RegisterPage.dart';
import 'package:sniper_pro/src/presentation/pages/client/descargo/ClientProductDescargoPage.dart';
import 'package:sniper_pro/src/presentation/pages/client/home/ClientHomePage.dart';
import 'package:sniper_pro/src/presentation/pages/client/product/detail/ClientProductDetailPage.dart';
import 'package:sniper_pro/src/presentation/pages/client/product/list/ClientProducListPage.dart';
import 'package:sniper_pro/src/presentation/pages/client/ranking/list/ClientrankingListPage.dart';
import 'package:sniper_pro/src/presentation/pages/client/videos/ClientvideoPage.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/category/create/ProfCategoryCreatePage.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/category/update/ProfCategoryUpdatePage.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/home/ProfHomePage.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/product/create/ProfProductCreatePage.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/product/list/ProfProducListPage.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/product/update/ProfProductUpdatePage.dart';
import 'package:sniper_pro/src/presentation/pages/profile/info/ProfileInfoPage.dart';
import 'package:sniper_pro/src/presentation/pages/profile/update/ProfileUpdatePage.dart';
import 'package:sniper_pro/src/presentation/pages/roles/RolesPage.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 
  await configureDependencies();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

   FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  await LocalNotification.initializeLocalNotificatio();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocProviders,
      child: MaterialApp(
        builder: FToastBuilder(),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: 'login',
        routes: {
          'login': (BuildContext context) => LoginPage(),
          'register': (BuildContext context) => RegisterPage(),
          'recuperarpass': (BuildContext context) => RecuperarpassPage(),
          'Roles': (BuildContext context) => RolesPage(),
          'client/home': (BuildContext context) => ClientHomePage(),
          'admin/home': (BuildContext context) => AdminHomePage(),
          'prof/home': (BuildContext context) => ProfHomePage(),
          'profile/info': (BuildContext context) => ProfileInfoPage(),
          'profile/update': (BuildContext context) => ProfileUpdatePage(),
          'admin/category/create': (BuildContext context) =>
              AdminCategoryCreatePage(),
          'Prof/category/create': (BuildContext context) =>
              ProfCategoryCreatePage(),
          'admin/category/update': (BuildContext context) =>
              AdminCategoryUpdatePage(),
          'admin/Zoom/update': (BuildContext context) => AdminZoomUpdatePage(),
          'Prof/category/update': (BuildContext context) =>
              ProfCategoryUpdatePage(),
          'admin/product/list': (BuildContext context) => AdminProducListPage(),
          'Prof/product/list': (BuildContext context) => ProfProducListPage(),
          'admin/product/create': (BuildContext context) =>
              AdminProductCreatePage(),
          'Prof/product/create': (BuildContext context) =>
              ProfProductCreatePage(),
          'admin/product/update': (BuildContext context) =>
              AdminProductUpdatePage(),
          'Prof/product/update': (BuildContext context) =>
              ProfProductUpdatePage(),
          'client/product/list': (BuildContext context) =>
              ClientProducListPage(),
          'client/product/detail': (BuildContext context) =>
              ClientProductDetailPage(),
          'login/cerrarsesion': (BuildContext context) => LogoutPage(),
          'admin/list/users': (BuildContext context) => AdminUserListPage(),
          'admin/reoprte': (BuildContext context) => adminreportePage(),
          'client/descargo': (BuildContext context) =>
              ClientProductDescargoPage(),
          'client/video': (BuildContext context) => ClientvideoPage(),
          'client/ranking': (BuildContext context) => ClientrankingListPage()
        },
      ),
    );
  }
}

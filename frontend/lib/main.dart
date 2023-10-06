import 'package:flutter/material.dart';
import 'package:frontend/controllers/mainscreen_provider.dart';
import 'package:frontend/views/ui/MainScreen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

// import 'views/ui/CartPage.dart';
// import 'views/ui/Home.dart';
// import 'views/ui/ProductPage.dart';
// import 'views/ui/ProfilePage.dart';
// import 'views/ui/SettingsPage.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //link per le directory
  final appDocumentDir = await getApplicationDocumentsDirectory();
  //path Hive
  final hivePath = appDocumentDir.path;
  Hive.init(hivePath);


  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => MainScreenNotifier())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-commerce App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MainScreen(),
        // '/product': (context) => const ProductPage(),
        // '/cart': (context) => const CartPage(),
        // '/profile': (context) => const ProfilePage(),
        // '/settings': (context) => const SettingsPage(),
      },
    );
  }
}

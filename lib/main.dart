import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fromytb/l10n/l10n.dart';
import 'package:fromytb/pages/main_app.dart';
import 'package:fromytb/provider/local_provider.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LocalProvider(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        supportedLocales: L10n.all,
        locale: Provider.of<LocalProvider>(context).locale,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: const MainPage(),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    Widget buildBottomBar() {
      const style = TextStyle(color: Colors.white);

      return BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(
            icon: Text('Localization', style: style),
            label: 'System',
          ),
          BottomNavigationBarItem(
            icon: Text('Localization', style: style),
            label: 'App',
          ),
        ],
        onTap: (int index) => setState(() => this.index = index),
      );
    }

    Widget buildPages() {
      switch (index) {
        case 0:
          return const LocalizationAppPage();
        case 1:
          return const LocalizationAppPage();
        default:
          return Container();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('change language...'),
      ),
      bottomNavigationBar: buildBottomBar(),
      body: buildPages(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../widgets/langue_picker_widget.dart';

class LocalizationAppPage extends StatefulWidget {
  const LocalizationAppPage({super.key});

  @override
  _LocalizationAppPageState createState() => _LocalizationAppPageState();
}

class _LocalizationAppPageState extends State<LocalizationAppPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('hello world'),
          centerTitle: true,
          actions: const [
            LanguagePickerWidget(),
            SizedBox(width: 12),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const LanguageWidget(),
              const SizedBox(height: 32),
              Text(
                AppLocalizations.of(context).language,
                style:
                    const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                AppLocalizations.of(context).hello('John'),
                style: const TextStyle(fontSize: 36),
              ),
            ],
          ),
        ),
      );
}

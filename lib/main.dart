import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_app/landingscreen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final theme = ThemeData(
  useMaterial3: true,
  textTheme: GoogleFonts.poppinsTextTheme(),
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Enter();
  runApp(const App());
}

Future<Supabase> Enter() {
  return Supabase.initialize(
  url: 'https://iipeuqcawywidwfymbiz.supabase.co',
  anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlpcGV1cWNhd3l3aWR3ZnltYml6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDc4NDQ4MzUsImV4cCI6MjA2MzQyMDgzNX0.FwEwLpj3Hp_KIC2OX9g8p4DLInzA4jcYJ9YweYpfCs0',
);
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const LandingScreen(),
      title: 'Laundry App',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('id', 'ID'), // Indonesia
        Locale('en', 'US'), // Inggris (opsional sebagai fallback)
      ],
    );
  }
}
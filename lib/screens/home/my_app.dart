import 'package:flutter/material.dart';
import 'home_screen.dart';

class MyApp extends StatefulWidget 
{
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> 
{
  
  
  @override
  Widget build(context) 
  {
    // Seed color for the whole app. Change this to tune the app's hue.
    const Color seedColor = Colors.deepPurple;

    // Generate light and dark color schemes from the same seed so
    // colors feel consistent between modes while adapting contrast.
    final ColorScheme lightScheme = ColorScheme.fromSeed(
      seedColor: seedColor,
      brightness: Brightness.light,
    );
    final ColorScheme darkScheme = ColorScheme.fromSeed(
      seedColor: seedColor,
      brightness: Brightness.dark,
    );

    return MaterialApp
    (
      debugShowCheckedModeBanner: false,

      // LIGHT THEME --------------------------------------------------
      theme: ThemeData(
        // Supply the generated color scheme so widgets automatically
        // pick matching colors (buttons, chips, switches, etc.).
        colorScheme: lightScheme,
        useMaterial3: true,

        // Scaffold background controls the default page background.
        scaffoldBackgroundColor: lightScheme.surface,

        // AppBarTheme adjusts the default AppBar look app-wide.
        appBarTheme: AppBarTheme(
          backgroundColor: lightScheme.primaryContainer,
          foregroundColor: lightScheme.onPrimaryContainer,
          centerTitle: true,
          elevation: 2,
        ),

        // ElevatedButtonTheme: consistent padding, shape and color.
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: lightScheme.primary,
            foregroundColor: lightScheme.onPrimary,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),

        // CardTheme: subtle rounded cards that match the scheme.
        cardTheme: CardThemeData(
          color: lightScheme.surface,
          elevation: 4,
          margin: const EdgeInsets.all(8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),

        // InputDecorationTheme: styles for TextField / TextFormField.
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: lightScheme.surfaceContainerHighest,
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),

        // Typography: tune headline / body sizes to be clear on mobile.
        textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: lightScheme.onSurface),
          bodyLarge: TextStyle(fontSize: 16, color: lightScheme.onSurface),
          bodyMedium: TextStyle(fontSize: 14, color: lightScheme.onSurface.withAlpha(230)),
        ),
      ),

      // DARK THEME ---------------------------------------------------
      darkTheme: ThemeData(
        colorScheme: darkScheme,
        useMaterial3: true,
        scaffoldBackgroundColor: darkScheme.surface,
        appBarTheme: AppBarTheme(
          backgroundColor: darkScheme.primaryContainer,
          foregroundColor: darkScheme.onPrimaryContainer,
          centerTitle: true,
          elevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: darkScheme.primary,
            foregroundColor: darkScheme.onPrimary,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        cardTheme: CardThemeData(
          color: darkScheme.surface,
          elevation: 3,
          margin: const EdgeInsets.all(8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          surfaceTintColor: darkScheme.surfaceTint,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: darkScheme.surfaceContainerHighest,
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: darkScheme.onSurface),
          bodyLarge: TextStyle(fontSize: 16, color: darkScheme.onSurface),
          bodyMedium: TextStyle(fontSize: 14, color: darkScheme.onSurface.withAlpha(230)),
        ),
      ),

      // Respect the system setting for light/dark, you can force with
      // ThemeMode.light or ThemeMode.dark when needed for testing.
      themeMode: ThemeMode.system,

      home: HomeScreen(),
    );
  }
}
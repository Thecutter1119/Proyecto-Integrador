import 'package:flutter/material.dart';

void main() => runApp(const AppBarApp());

class AppBarApp extends StatelessWidget {
  const AppBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppBar Demo',
      debugShowCheckedModeBanner: false, // 🔹 quita la etiqueta "DEBUG"
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue, // 🔹 color principal de la app
          brightness: Brightness.light, // 🔹 modo claro
        ),
        useMaterial3: true, // 🔹 diseño Material 3 (más moderno)
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue, // 🔹 AppBar azul
          foregroundColor: Colors.white, // 🔹 texto e íconos blancos
          elevation: 3, // 🔹 pequeña sombra debajo del AppBar
          centerTitle: false,
        ),
      ),
      home: const AppBarExample(),
    );
  }
}

class AppBarExample extends StatelessWidget {
  const AppBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBar Demo'),
        actions: <Widget>[
          // 🔔 Botón 1: muestra SnackBar
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Esta es la notificación'),
                  backgroundColor: Colors.blueAccent,
                ),
              );
            },
          ),

          // ➡️ Botón 2: navega a otra página
          IconButton(
            icon: const Icon(Icons.navigate_next),
            tooltip: 'Go to the next page',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return const NextPage();
                  },
                ),
              );
            },
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.house),
          tooltip: 'Go back',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: const Center(
        child: Text(
          'This is the home page of John Esneider Marin',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Next page')),
      body: const Center(
        child: Text('This is the next page', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

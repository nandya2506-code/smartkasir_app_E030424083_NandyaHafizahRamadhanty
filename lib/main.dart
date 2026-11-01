// Mengimpor pustaka antarmuka Material Design utama dari framework Flutter 
import 'package:flutter/material.dart'; 
// Mengimpor halaman Splash Screen 
import 'pages/splash_screen_page.dart'; 
 
// Fungsi utama (entry point) aplikasi 
void main() { 
  runApp(const SmartKasirApp()); 
} 
 
// Deklarasi kelas root aplikasi turunan StatelessWidget 
class SmartKasirApp extends StatelessWidget { 
  const SmartKasirApp({super.key}); 
 
  @override 
  Widget build(BuildContext context) { 
    return MaterialApp( 
      title: 'SmartKasir', 
      debugShowCheckedModeBanner: false, 
      theme: ThemeData( 
        useMaterial3: true, 
        colorScheme: ColorScheme.fromSeed( 
          seedColor: Colors.purple, // [TANTANGAN LIVE TWEAK]: Mengubah tema dasar menjadi Ungu Modern
          brightness: Brightness.light, 
        ), 
        appBarTheme: const AppBarTheme( 
          centerTitle: true, 
          elevation: 2, 
          backgroundColor: Colors.purple, // Menyesuaikan warna AppBar dengan tema ungu
          foregroundColor: Colors.white, 
        ), 
      ), 
      // Titik awal aplikasi dibuka pertama kali melalui SplashScreenPage() 
      home: const SplashScreenPage(), 
    ); 
  }
}
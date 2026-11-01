// Mengimpor pustaka kontrol waktu dan timer asinkron bawaan bahasa Dart 
import 'dart:async'; 
// Mengimpor pustaka antarmuka Material Design utama Flutter 
import 'package:flutter/material.dart'; 
// Mengimpor halaman navigasi utama sebagai tujuan perpindahan layar 
import 'main_navigation_page.dart'; 
 
// Komponen/Widget SplashScreenPage turunan StatefulWidget: Mengelola status timer hitung mundur 
class SplashScreenPage extends StatefulWidget { 
  const SplashScreenPage({super.key}); 
 
  @override 
  State<SplashScreenPage> createState() => _SplashScreenPageState(); 
} 
 
// Kelas pengelola state, timer asinkron, dan logika navigasi Splash Screen 
class _SplashScreenPageState extends State<SplashScreenPage> { 
  int _durasiDetik = 10; 
  Timer? _timer; 
 
  @override 
  void initState() { 
    super.initState(); 
    _mulaiHitungMundur(); 
  } 
 
  void _mulaiHitungMundur() { 
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) { 
      if (_durasiDetik > 1) { 
        setState(() { 
          _durasiDetik--; 
        }); 
      } else { 
        _timer?.cancel(); 
        if (!mounted) return; 
        Navigator.pushReplacement( 
          context, 
          MaterialPageRoute(builder: (context) => const MainNavigationPage()), 
        ); 
      } 
    }); 
  } 
 
  @override 
  void dispose() { 
    _timer?.cancel(); 
    super.dispose(); 
  } 
 
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      // [PERUBAHAN]: Mengubah latar belakang Splash Screen menjadi Ungu Elegan 
      backgroundColor: Colors.purple.shade800,  
      body: Center( 
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [ 
            Container( 
              padding: const EdgeInsets.all(24), 
              decoration: BoxDecoration( 
                color: Colors.white, 
                shape: BoxShape.circle, 
                boxShadow: [ 
                  BoxShadow( 
                    color: Colors.black.withValues(alpha: 0.2), 
                    blurRadius: 15, 
                    offset: const Offset(0, 5), 
                  ), 
                ], 
              ), 
              child: Icon( 
                Icons.point_of_sale_rounded, 
                size: 72, 
                // [PERUBAHAN]: Warna ikon mengikuti tema Ungu 
                color: Colors.purple.shade800,           
              ), 
            ), 
            const SizedBox(height: 24), 
            const Text( 
              'SmartKasir', 
              style: TextStyle( 
                fontSize: 26, 
                fontWeight: FontWeight.bold, 
                color: Colors.white, 
                letterSpacing: 1.2, 
              ), 
            ), 
            const SizedBox(height: 6), 
            const Text( 
              'Aplikasi Kasir Point of Sale Digital', 
              style: TextStyle( 
                fontSize: 13, 
                color: Colors.white70, 
              ), 
            ), 
            const SizedBox(height: 36), 
            const SizedBox( 
              width: 28, 
              height: 28, 
              child: CircularProgressIndicator( 
                color: Colors.amber, 
                strokeWidth: 3, 
              ), 
            ), 
            const SizedBox(height: 14), 
            Text( 
              'Menyiapkan sistem SmartKasir ($_durasiDetik detik)...', 
              style: const TextStyle( 
                fontSize: 12, 
                color: Colors.white70, 
              ), 
            ), 
            const SizedBox(height: 40), 
            Text( 
              'Versi 1.0.0 — Modul Pertemuan 10', 
              style: TextStyle(fontSize: 11, color: Colors.purple.shade200), 
            ), 
          ], 
        ), 
      ), 
    ); 
  } 
}
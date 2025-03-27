import 'package:apphayvan/ilanListesi/view/ev_view.dart';
import 'package:apphayvan/ilanListesi/view/home_screen.dart';
import 'package:apphayvan/ilanListesi/view/profile_view.dart';
import 'package:apphayvan/ilanListesi/view_model/ilanListesi_view_mixin.dart';
import 'package:flutter/material.dart';
import 'package:apphayvan/ilanListesi/view/ilanlistesi_card_view.dart';

import 'package:flutter/material.dart';
import 'package:apphayvan/ilanListesi/view/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Hayvan',
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

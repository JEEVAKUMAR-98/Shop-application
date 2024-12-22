// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:sha_app/widget/collection_sections.dart';
import 'package:sha_app/widget/hero_sections.dart';
import 'package:sha_app/widget/inspire_sections.dart';
import 'package:sha_app/widget/navbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const [
            NavBar(),
            HeroSection(),
            CollectionSection(),
            InspirationSection(),
          ],
        ),
      ),
    );
  }
}

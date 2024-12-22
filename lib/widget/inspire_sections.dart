// lib/widgets/inspiration_section.dart
import 'package:flutter/material.dart';
import 'package:sha_app/services/unsplash_services.dart';

class InspirationSection extends StatelessWidget {
  const InspirationSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Inspiring interiors\ncrafted with passion',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 32),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.5,
            ),
            itemCount: 4,
            itemBuilder: (context, index) => _buildInspirationCard(),
          ),
        ],
      ),
    );
  }

  Widget _buildInspirationCard() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: FutureBuilder<String>(
        future: UnsplashService.getRandomImage('interior-design'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Image.network(
              snapshot.data!,
              fit: BoxFit.cover,
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

// classic_promo_card.dart
import 'package:flutter/material.dart';

class ClassicPromoCard extends StatelessWidget {
  const ClassicPromoCard({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFE5E7EB),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 12, offset: Offset(0, 6)),
        ],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Chip(label: Text('קלסי'), backgroundColor: Colors.white),
        ),
        const SizedBox(height: 12),
        const Text('₪0 / לחודש', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        const Text('חודשים חינם\nללא התחייבות'),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(shape: const StadiumBorder(), backgroundColor: const Color(0xFF4B5563)),
          child: const Text('להצטרפות'),
        ),
        const SizedBox(height: 16),
        const _Bullet(text: 'פרופיל עסקי'),
        const _Bullet(text: 'פרסום מאמרים ומבצעים'),
        const _Bullet(text: 'הופעה במפת חיפושים'),
      ]),
    );
  }
}

class _Bullet extends StatelessWidget {
  const _Bullet({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(children: [
        const Icon(Icons.circle_outlined, size: 18),
        const SizedBox(width: 8),
        Expanded(child: Text(text)),
      ]),
    );
  }
}


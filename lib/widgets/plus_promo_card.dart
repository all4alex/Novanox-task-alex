import 'package:flutter/material.dart';
class ClassicPlusPromoCard extends StatelessWidget {
  const ClassicPlusPromoCard({super.key});
static const LinearGradient classicPlusGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color(0xFFFFD6E8), // soft pink (top)
    Color(0xFFF1D9F8), // light lilac
    Color(0xFFD6CFFF), // lavender
    Color(0xFFC8C9FF), // bottom purple
  ],
  stops: [0.0, 0.35, 0.65, 1.0],
);
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        padding: const EdgeInsets.fromLTRB(20, 18, 20, 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          gradient: classicPlusGradient,
          border: Border.all(
            color: const Color(0xFFB9AFFF).withOpacity(0.35),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFB7A8FF).withOpacity(0.35),
              blurRadius: 26,
              offset: const Offset(0, 14),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// TOP
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _SoftBadge(),
                const Text(
                  'קלאסי+',
                  style: TextStyle(
                    fontFamily: 'Heebo',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF4A4A6A),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 22),

            /// PRICE
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontFamily: 'Heebo',
                  color: Color(0xFF4A4A6A),
                ),
                children: [
                  TextSpan(
                    text: '₪179',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: ' / לחודש',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            /// CTA
            Container(
              height: 48,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xFF4F5A63),
                borderRadius: BorderRadius.circular(26),
              ),
              child: const Text(
                'להצטרפות',
                style: TextStyle(
                  fontFamily: 'Heebo',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// FEATURES
            ...const [
              _Feature('פרופיל עסקי'),
              _Feature('השתתפות פיזית באירועי ביזנלנד ומאמסטרס'),
              _Feature(
                'יצירת סדנאות, אירועים ומפגשי און ליין ברמת האירועים של האפליקציה',
              ),
              _Feature('הופעת הפרופיל שלך ברמת האירועים'),
              _Feature('פרסום מאמרים ומבצעים באפליקציה'),
            ],
          ],
        ),
      ),
    );
  }
}

class _SoftBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.75),
        borderRadius: BorderRadius.circular(14),
      ),
      child: const Text(
        'חודשים חינם\nללא התחייבות',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Heebo',
          fontSize: 12.5,
          fontWeight: FontWeight.w700,
          color: Color(0xFF6A6AA0),
          height: 1.1,
        ),
      ),
    );
  }
}

class _Feature extends StatelessWidget {
  final String text;

  const _Feature(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            const Icon(Icons.circle_outlined, size: 9,  color: Colors.white,),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontFamily: 'Heebo',
                fontSize: 14.5,
                height: 1.4,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

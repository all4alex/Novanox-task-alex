import 'package:flutter/material.dart';
import 'package:novanox_task_for_alex/welcome_screen.dart';

class PremiumPromoCard extends StatelessWidget {
  const PremiumPromoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 12),
        padding: const EdgeInsets.fromLTRB(20, 18, 20, 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF5F86F2),
              Color(0xFF6F6AE8),
              Color(0xFF8A78F0),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// TOP ROW
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _TopBadge(),
                const Text(
                  'פרימיום',
                  style: TextStyle(
                    fontFamily: 'Heebo',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            /// PRICE
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontFamily: 'Heebo',
                  color: Colors.white,
                ),
                children: [
                  TextSpan(
                    text: '₪229',
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

            /// CTA BUTTON
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => WelcomeScreen()),
                );
              },
              child: Container(
                height: 48,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFF4E5962),
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
            ),

            const SizedBox(height: 18),

            /// FEATURES
            _Feature('פרופיל עסקי'),
            _Feature('השתתפות פיזית באירועי ביזנלנד ומאמסטרס'),
            _Feature('יצירת אירועים ומפגשי און ליין ברמת האירועים של האפליקציה'),
            _Feature('פרסום כחברת מובילות שלך באתר ביזנלנד'),
            _Feature('פרסום מאמרים ומבצעים באפליקציה'),
            _Feature('הופעת הפרופיל שלך ברמת הוצאות'),
            _Feature('פרסום טיפ מקצועי שלך ופוסט "שאלות ותשובות" חודש ברשתות החברתיות של ביזנלנד'),
          ],
        ),
      ),
    );
  }
}

class _TopBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFDCE6FF),
        borderRadius: BorderRadius.circular(14),
      ),
      child: const Text(
        'הכי משתלם!',
        style: TextStyle(
          fontFamily: 'Heebo',
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: Color(0xFF3A4E8C),
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

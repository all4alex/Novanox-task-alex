import 'package:flutter/material.dart';
import 'package:novanox_task_for_alex/widgets/classic_promo_card.dart';
import 'package:novanox_task_for_alex/widgets/custom_stepper.dart';
import 'package:novanox_task_for_alex/widgets/plus_promo_card.dart';
import 'package:novanox_task_for_alex/widgets/premium_promo_card.dart';


void main() {
  runApp(const TeamMamaApp());
}

class TeamMamaApp extends StatelessWidget {
  const TeamMamaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color(0xFFF6F7FB),
      ),
      home: const Directionality(
        textDirection: TextDirection.rtl,
        child: InitialPlansScreen(),
      ),
    );
  }
}

class InitialPlansScreen extends StatelessWidget {
  const InitialPlansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),

              const Text(
                'תשלום',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),

              CustomOrderStepper(activeStep: 0),
              const Text(
                'המסלולים שלנו',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 12),
              PromoCardsPager(
                cards: [
                  PremiumPromoCard(),

                  ClassicPlusPromoCard(),
                  ClassicPromoCard(onPressed: () {}),
                ],
              ),
              const SizedBox(height: 16),
              _TermsSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class _TopStepper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: const Color(0xFFF26C6C),

            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              '2',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: const Color(0xFFE5E7EB),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              '1',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF6B7280),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PromoCardsPager extends StatefulWidget {
  final List<Widget> cards;

  const PromoCardsPager({super.key, required this.cards});

  @override
  State<PromoCardsPager> createState() => _PromoCardsPagerState();
}

class _PromoCardsPagerState extends State<PromoCardsPager> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.85, // 👈 controls side preview
      initialPage: 1, // center card
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // 🔥 IMPORTANT for Hebrew
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.7,
        child: PageView.builder(
          controller: _pageController,
          itemCount: widget.cards.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: widget.cards[index],
            );
          },
        ),
      ),
    );
  }
}

class _PlansCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20, top: 20),
      height: 400,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          SizedBox(width: 8),
          _PlanCard(title: 'CLASSIC', price: '₪0 / חודש', highlighted: false),
          _PlanCard(title: 'PLUS', price: '₪179 / חודש', highlighted: true),
          _PlanCard(title: 'PREMIUM', price: '₪229 / חודש', highlighted: false),
          SizedBox(width: 8),
        ],
      ),
    );
  }
}

class _PlanCard extends StatelessWidget {
  final String title;
  final String price;
  final bool highlighted;

  const _PlanCard({
    required this.title,
    required this.price,
    required this.highlighted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: highlighted
            ? const LinearGradient(
                colors: [Color(0xFFFFC1D9), Color(0xFFE0E7FF)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
        color: highlighted ? null : Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Color(0x22000000),
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          Text(
            price,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          _Feature('גישה לתכנים'),
          _Feature('מאמרים נבחרים'),
          _Feature('עדכונים שוטפים'),
          const Spacer(),
          SizedBox(
            height: 44,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4B5563),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22),
                ),
              ),
              onPressed: () {},
              child: const Text(
                'להצטרפות',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
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
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          const Icon(Icons.check, size: 16, color: Color(0xFFF26C6C)),
          const SizedBox(width: 6),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 12))),
        ],
      ),
    );
  }
}

class _TermsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          Text(
            'למה להצטרף ל-TeamMama?',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              fontFamily: 'Heebo',
            ),
          ),
          SizedBox(height: 8),
          Text(
            'גישה לתכנים מקצועיים, ליווי אישי, ותמיכה מלאה לאורך כל הדרך.\nכל התכנים מותאמים במיוחד לאימהות.',
            style: TextStyle(
              fontSize: 13,
              fontFamily: 'Heebo',
              height: 1.5,
              color: Color(0xFF4B5563),
            ),
          ),

          SizedBox(height: 22),

          Text(
            'חשיפה',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              fontFamily: 'Heebo',
            ),
          ),
          SizedBox(height: 8),
          Text(
            'קבלי חשיפה לעסק שלך מול אלפי אמהות בכל יום ומיקוד איכותי שמחפש עזרה בעסק בדיוק כמו שלך',
            style: TextStyle(
              fontFamily: 'Heebo',
              fontSize: 13,
              height: 1.5,
              color: Color(0xFF4B5563),
            ),
          ),

          SizedBox(height: 22),

          Text(
            'חזקות כל נותן',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              fontFamily: 'Heebo',
            ),
          ),
          SizedBox(height: 8),
          Text(
            'ההורים שמחפשים שירותים מקבלים תוצאות איכותיות ולא צריכות לבזבז זמן על חיפוש גדול',
            style: TextStyle(
              fontFamily: 'Heebo',
              fontSize: 13,
              height: 1.5,
              color: Color(0xFF4B5563),
            ),
          ),

          SizedBox(height: 22),

          Text(
            'התאמה למקצב',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              fontFamily: 'Heebo',
            ),
          ),
          SizedBox(height: 8),
          Text(
            'אנו מציעים חבילות שמתאימות לקצב שלך, מה שמאפשר שתוכלי לבחור את החשיפה המתאימה לך',
            style: TextStyle(
              fontSize: 13,
              fontFamily: 'Heebo',
              height: 1.5,
              color: Color(0xFF4B5563),
            ),
          ),

          SizedBox(height: 22),

          Text(
            'פרסום במדור המאמרים',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              fontFamily: 'Heebo',
            ),
          ),
          SizedBox(height: 8),
          Text(
            'אפשרות לפרסם תוכן מקצועי ולקבל חשיפה נוספת. תוכלי לחזק את המומחיות שלך ולהגיע לעוד קהל יעד שרוצה את השירותים בתחום ולקבל פניות חדשות.',
            style: TextStyle(
              fontSize: 13,
              height: 1.5,
              fontFamily: 'Heebo',

              color: Color(0xFF4B5563),
            ),
          ),

          SizedBox(height: 22),

          Text(
            'פופולריות',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              fontFamily: 'Heebo',
            ),
          ),
          SizedBox(height: 8),
          Text(
            'פרסום במדור נגיש לכל המגזר. האפליקציה מאפשרת חיפוש מהיר לפי תחום, אזור וזמן פעילות (24/7). כך לקוחות יוכלו למצוא את העסק שלך באופן פשוט וקל, גם בזמן חופשי.',
            style: TextStyle(
              fontSize: 13,
              fontFamily: 'Heebo',

              height: 1.5,
              color: Color(0xFF4B5563),
            ),
          ),

          SizedBox(height: 22),

          Text(
            'חיבור ישיר ומוסף',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              fontFamily: 'Heebo',
            ),
          ),
          SizedBox(height: 8),
          Text(
            'תוכלי לתקשר עם לקוחות פוטנציאליים ב-TeamMama בצורה נוחה. יצירת קשר מהיר, קליל, והזדמנות להרחיב את המעגל שלך בצורה חכמה.',
            style: TextStyle(
              fontSize: 13,
              fontFamily: 'Heebo',

              height: 1.5,
              color: Color(0xFF4B5563),
            ),
          ),

          SizedBox(height: 26),

          Center(
            child: Text(
              'למעבר לעמוד הפרסום ב-TeamMama',

              style: TextStyle(
                fontFamily: 'Heebo',
                fontSize: 13,
                color: Color(0xFF3B6EA8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


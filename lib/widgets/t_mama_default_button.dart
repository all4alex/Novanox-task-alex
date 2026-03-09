import 'package:flutter/material.dart';
import 'package:novanox_task_for_alex/app/theme/app_text_styles.dart';

class TMamaDefaultButton extends StatelessWidget {
  const TMamaDefaultButton({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {  },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        backgroundColor:          const Color(0xFFF16B6A),

        
        shadowColor: Colors.transparent,
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
       
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 10,
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style: AppTextStyles.defBtnTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}

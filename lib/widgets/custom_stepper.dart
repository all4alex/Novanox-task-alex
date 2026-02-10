import 'package:flutter/material.dart';
import 'package:easy_stepper/easy_stepper.dart';

class CustomOrderStepper extends StatelessWidget {
  final int activeStep; // 0-based index

  const CustomOrderStepper({
    super.key,
    required this.activeStep,
  });

  @override
  Widget build(BuildContext context) {
    const Color red = Color(0xFFF15B5B);
    const Color greyLine = Color(0xFFE6E6E6);

    return EasyStepper(
      activeStep: activeStep,
      lineStyle: const LineStyle(
        lineLength: 25,
        lineThickness: 3,
        lineType: LineType.normal,
        defaultLineColor: greyLine,
        finishedLineColor: greyLine,
      ),
      stepShape: StepShape.circle,
      stepBorderRadius: 1,
      borderThickness: 2,
      internalPadding: 0,
      showLoadingAnimation: false,
      showStepBorder: true,
      fitWidth: true,
      steps: List.generate(5, (index) {
        final bool isCompleted = index < activeStep;
        final bool isActive = index == activeStep;

        return EasyStep(
          customStep: _buildCircle(
            number: 5 - index, // To match 5 → 1 from left to right
            isCompleted: isCompleted,
            isActive: isActive,
            red: red,
          ),
          title: '',
        );
      }),
    );
  }

  Widget _buildCircle({
    required int number,
    required bool isCompleted,
    required bool isActive,
    required Color red,
  }) {
    final bool isUpcoming = !isCompleted && !isActive;

    return Container(
      width: 26,
      height: 26,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isUpcoming ? Colors.white : red,
        border: Border.all(
          color: red,
          width: 2,
        ),
      ),
      child: Text(
        number.toString(),
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: isUpcoming ? red : Colors.white,
        ),
      ),
    );
  }
}

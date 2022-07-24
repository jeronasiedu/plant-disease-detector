import 'dart:ui';

import 'package:flutter/material.dart';

class InstructionsCard extends StatelessWidget {
  const InstructionsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 2,
        sigmaY: 2,
      ),
      child: Container(
        padding: const EdgeInsets.only(left: 15, top: 15, right: 8),
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.lightGreen.withOpacity(0.4),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Instruction(
              number: '1',
              instruction:
                  'Take/Select a photo of an affected plant by tapping the camera button below',
            ),
            Instruction(
              number: '2',
              instruction:
                  'Give it a shot before you can get a suggestion of the disease',
            ),
          ],
        ),
      ),
    );
  }
}

class Instruction extends StatelessWidget {
  final String number;
  final String instruction;
  const Instruction({
    Key? key,
    required this.number,
    required this.instruction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 25,
          child: Text(number, style: Theme.of(context).textTheme.headlineSmall),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Text(
            instruction,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.white),
          ),
        )
      ],
    );
  }
}

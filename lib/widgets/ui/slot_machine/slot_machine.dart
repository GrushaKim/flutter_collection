import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_collection/utils/my_colors.dart';
import 'package:flutter_collection/widgets/ui/slot_machine/sliding_number.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roller_list/roller_list.dart';

class SlotMachine extends StatefulWidget {
  SlotMachine({Key? key}) : super(key: key);

  @override
  State<SlotMachine> createState() => _SlotMachineState();
}

class _SlotMachineState extends State<SlotMachine> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SlidingNumber(
        number: 555,
        duration: const Duration(seconds: 3),

      ),
    );
  }
}

// class _SlotMachineState extends State<SlotMachine> {
  
//   Timer? rotator;
//   int? _first, _second, _third;
//   // int? _random; 
//   Random _random = Random();
//   final leftRoller = GlobalKey<RollerListState>();
//   final rightRoller = GlobalKey<RollerListState>();
//   final List<Widget> slots = [];

  

//   _getSlots() {
//     for (int i = 0; i < 5; i++) {
//       slots.add(Container(
//         padding: const EdgeInsets.all(4),
//         color: MyColors.bgPurple,
//         child: SvgPicture.asset(
//           'assets/ui/slot${i + 1}.svg',
//           height: 48,
//         ),
//       ));
//     }
//   }

//   // _getRandom() {
//   //   _random = Random().nextInt(5) + 0;
//   // }

//   _startRotating() {
//     rotator = Timer.periodic(const Duration(seconds: 3), _rotateRoller);
//   }

//   _rotateRoller(_) {
//     final leftTarget = _random.nextInt(3 * slots.length);
//     final rightTarget = _random.nextInt(3 * slots.length);
//     leftRoller.currentState?.smoothScrollToIndex(
//       leftTarget,
//       duration: Duration(seconds: 3,), 
//       curve: Curves.linear
//     );
//     rightRoller.currentState?.smoothScrollToIndex(
//       rightTarget,
//       duration: Duration(seconds: 3,), 
//       curve: Curves.linear
//     );
//   }

//   _finishRotating() {
//     rotator?.cancel();
//   }

//   @override
//   void initState() {
//     _getSlots();
//     // _getRandom();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: Helper.height * .5,
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Row(
//         children: [
//           Expanded(
//             flex: 1,
//             child: RollerList(
//               items: slots,
//               enabled: false,
//               key: leftRoller,
//               onSelectedIndexChanged: (value) {
//                 setState(() {
//                   _first = value;
//                 });
//               },  
//             ),
//           ),
//           divider(),
//           Expanded(
//             flex: 1,
//             child: RollerList(
//               items: slots,
//               onSelectedIndexChanged: (value) {
//                 setState(() {
//                   _second = value;
//                 });
//                 _finishRotating();
//               },
//             ),
//           ),
//           divider(),
//           Expanded(
//             flex: 1,
//             child: RollerList(
//               enabled: false,
//               items: slots,
//               key: rightRoller,
//               onSelectedIndexChanged: (value) {
//                 setState(() {
//                   _third = value;
//                 });
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   divider() => const VerticalDivider(
//     width: 2,
//     color: Colors.black,
//   );
// }

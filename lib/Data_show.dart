import 'package:flutter/cupertino.dart';

class Data_show extends StatefulWidget {
  const Data_show({super.key});

  @override
  State<Data_show> createState() => _Data_showState();
}

class _Data_showState extends State<Data_show> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 1, 11, 20),
            Color.fromARGB(255, 4, 31, 54),
          ],
          transform: GradientRotation(40),
          // stops: [0.5, 0],
        ),
      ),
    );
  }
}

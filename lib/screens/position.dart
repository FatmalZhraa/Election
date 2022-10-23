import 'package:electiooon/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/main/main_cubit.dart';
class Position extends StatelessWidget {
  Position({Key? key, required this.index, required this.text})
      : super(key: key);
  int index;
  String text;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = MainCubit.get(context);
        return GestureDetector(
          onTap: () {
            cubit.position_name(index);
          },
          child:Center(
            child: AnimatedButton(
              height: 180,
              width: 300,
              isReverse: true,
              text: '$text',
              selectedTextColor:  Color(0xFF9B291F),
              transitionType: TransitionType.LEFT_TO_RIGHT,
              textStyle: TextStyle(
                  fontSize: 20,
                  letterSpacing: 3,
                  color: Colors.white,
                  fontWeight: FontWeight.w400),
              backgroundColor: Color(0xFF9B291F),
              borderColor: Color(0xFF9B291F),
              borderRadius: 20,
              borderWidth: 2,
              onPress: () {
                context.read()<MainCubit>().position [index]['position'];
                Navigator.push(context, new MaterialPageRoute(builder: (__) => new LoginScreen()));
              },
            ),
          ),
        );
      },
    );
  }
}

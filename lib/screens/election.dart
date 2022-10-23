
import 'package:electiooon/screens/position.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../blocs/main/main_cubit.dart';
class Election_Screen extends StatelessWidget {
  const Election_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: BlocConsumer<MainCubit, MainState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              var cubit = MainCubit.get(context);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Election",
                    style: TextStyle(fontSize: 30,color: Color(0xFF9B291F)),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) => Position(
                          index: index,
                          text: cubit.position [index],
                        ),
                        separatorBuilder: (context, index) => SizedBox(
                          height: 10.h,
                        ),
                        itemCount: cubit.position .length),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}


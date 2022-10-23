import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Models/user.dart';
import '../../blocs/login/login_cubit.dart';
import '../../blocs/main/main_cubit.dart';
import '../items/default_text_form_field.dart';
import 'election.dart';
class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  myformstate(){
    selectedname=userName[0];
  }
  final _formKey = GlobalKey<FormState>();

  List<String> userName = ["Fatoom", "Omar","Ahmed","Sara","Alaa"];
  String? selectedname="Fatoom";

  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = MainCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child:
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "UserName", style: TextStyle(color: Color(0xFF9B291F),),),

                      SizedBox(height: 60.h,width: 350.w,

                        child: DropdownButtonFormField(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          value: selectedname,
                          items: userName.map((e) => DropdownMenuItem(child: Text(e),value: e,)
                          ).toList(),
                          onChanged: (val){
                            ListView.separated(
                                itemBuilder: (context, index) => myformstate(),
                                separatorBuilder: (context, index) => SizedBox(
                                  height: 10.h,
                                ),
                                itemCount: cubit.position .length);},

                          icon: const Icon(
                            Icons.arrow_drop_down_circle,
                            color: Color(0xFF9B291F)),),),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "Password", style: TextStyle(color: Color(0xFF9B291F),),
                      ),
                      DefaultTextFormField(
                        textInputType: TextInputType.visiblePassword,
                        controller: passwordController,
                        isPassword: true,
                        maxLines: 1,),

                      SizedBox(
                        height: 20.h,
                      ),
                      BlocConsumer<LoginCubit, LoginState>(
                        listener: (context, state) {
                          // TODO: implement listener
                          if (state is LoginSuccessfulState) {
                            Navigator.push(context, new MaterialPageRoute(builder: (__) => new Election_Screen())
                            );
                          }},
                        builder: (context, state) {
                          return (state is LoginLoadingState) ? const Center(
                            child: CircularProgressIndicator(),) :
                          Center(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:Color(0xFF9B291F), // background (button) color
                                  foregroundColor: Colors.white,
                                  minimumSize: Size(290, 50)// foreground (text) color
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    User user = User(
                                        password: passwordController.text);
                                    LoginCubit.get(context).login(user);
                                    Navigator.push(context, new MaterialPageRoute(builder: (__) => new Election_Screen()));
                                  }
                                },
                                 child: Text("Login",style: TextStyle(fontSize: 20,letterSpacing: 3,),)),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
    );
  }
}

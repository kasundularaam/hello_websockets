import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_websockets/consts/styles.dart';
import 'package:hello_websockets/logic/cubit/cmd_loading_cubit.dart';

class CmdLoading extends StatefulWidget {
  const CmdLoading({Key? key}) : super(key: key);

  @override
  State<CmdLoading> createState() => _CmdLoadingState();
}

class _CmdLoadingState extends State<CmdLoading> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CmdLoadingCubit>(context).load();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CmdLoadingCubit, CmdLoadingState>(
      listener: (context, state) {
        if (state is CmdLoadingEnd) {
          BlocProvider.of<CmdLoadingCubit>(context).load();
        }
      },
      builder: (context, state) {
        if (state is CmdLoadingf) {
          return Text(
            "/",
            style: MyStyles.cmdLoadStyle,
          );
        } else if (state is CmdLoadingd) {
          return Text(
            "-",
            style: MyStyles.cmdLoadStyle,
          );
        } else if (state is CmdLoadingb) {
          return Text(
            "\\",
            style: MyStyles.cmdLoadStyle,
          );
        } else if (state is CmdLoadings) {
          return Text(
            "|",
            style: MyStyles.cmdLoadStyle,
          );
        } else {
          print(state.toString());
          return Text("");
        }
      },
    );
  }
}

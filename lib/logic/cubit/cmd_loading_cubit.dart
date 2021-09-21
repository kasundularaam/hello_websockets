import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cmd_loading_state.dart';

class CmdLoadingCubit extends Cubit<CmdLoadingState> {
  CmdLoadingCubit() : super(CmdLoadingInit());

  static const int dur = 100;
  Future<void> load() async {
    emit(CmdLoadings());
    await Future.delayed(Duration(milliseconds: dur));
    emit(CmdLoadingf());
    await Future.delayed(Duration(milliseconds: dur));
    emit(CmdLoadingd());
    await Future.delayed(Duration(milliseconds: dur));
    emit(CmdLoadingb());
    await Future.delayed(Duration(milliseconds: dur));
    emit(CmdLoadings());
    await Future.delayed(Duration(milliseconds: dur));
    emit(CmdLoadingf());
    await Future.delayed(Duration(milliseconds: dur));
    emit(CmdLoadingd());
    await Future.delayed(Duration(milliseconds: dur));
    emit(CmdLoadingb());
    await Future.delayed(Duration(milliseconds: dur));
    emit(CmdLoadingEnd());
  }
}

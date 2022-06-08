part of 'timer_bloc.dart';

abstract class TimerState{}

class AllTimersState extends TimerState {
  final List<TimerModel> listTimer;
  AllTimersState({required this.listTimer});
}

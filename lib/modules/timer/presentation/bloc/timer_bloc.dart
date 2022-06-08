import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:test_timer/modules/timer/data/models/timer_model.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  TimerBloc() : super(AllTimersState(listTimer: <TimerModel>[])) {
    List<TimerModel> listTimer = [];

    void endTimer() {
      for (TimerModel element in listTimer) {
        if (element.time.rawTime.value == 0) {
          listTimer.remove(element);
          break;
        }
      }
      for (int i = 0; i < listTimer.length; i++) {
        if (listTimer[i].isPaused && i < 4) {
          listTimer[i].time.onExecute.add(StopWatchExecute.start);
          listTimer[i] = listTimer[i].copyWith(isPaused: false);
        }
      }
      add(AllTimersEvent());
    }

    int random(min, max) {
      var rn = Random();
      return min + rn.nextInt(max - min + 1);
    }

    on<AllTimersEvent>((event, emit) {
      emit(AllTimersState(listTimer: listTimer));
    });

    on<AddNewTimerEvent>((event, emit) {
      StopWatchTimer stopWatchTimer = StopWatchTimer(
        mode: StopWatchMode.countDown,
        onEnded: endTimer,
      );
      stopWatchTimer.setPresetSecondTime(random(10, 20));
      TimerModel timer = TimerModel(
        index: listTimer.isEmpty ? 1 : listTimer.last.index + 1,
        time: stopWatchTimer,
        isPaused: listTimer.length > 3 ? true : false,
      );
      listTimer.add(timer);
      if (!timer.isPaused) stopWatchTimer.onExecute.add(StopWatchExecute.start);
    });
  }
}

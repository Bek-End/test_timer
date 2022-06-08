import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

@immutable
class TimerModel extends Equatable{
  final int index;
  final StopWatchTimer time;
  final bool isPaused;
  const TimerModel({
    required this.index,
    required this.time,
    required this.isPaused,
  });
  

  @override
  List<Object?> get props => [index, time, isPaused];

  TimerModel copyWith({
    final int? index,
    final StopWatchTimer? time,
    final bool? isPaused,
  }) =>
      TimerModel(
        index: index ?? this.index,
        time: time ?? this.time,
        isPaused: isPaused ?? this.isPaused,
      );
}

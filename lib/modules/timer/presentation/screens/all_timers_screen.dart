import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_timer/modules/core/presentation/l10n/app_localizations.dart';
import 'package:test_timer/modules/core/presentation/theme/app_theme.dart';
import 'package:test_timer/modules/core/presentation/widgets/loading.dart';
import 'package:test_timer/modules/timer/data/models/timer_model.dart';
import 'package:test_timer/modules/timer/presentation/bloc/timer_bloc.dart';
import 'package:test_timer/modules/timer/presentation/screens/new_random_timer.dart';

class AllTimersScreen extends StatelessWidget {
  const AllTimersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = AppTheme.of(context).textTheme;
    return BlocProvider(
      create: (context) => TimerBloc(),
      child: BlocBuilder<TimerBloc, TimerState>(
        builder: (context, state) {
          if (state is AllTimersState) {
            final listTimer = state.listTimer;
            return Scaffold(
              appBar: AppBar(
                title: Text(l10n.timersList.toUpperCase()),
              ),
              body: SafeArea(
                child: ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: listTimer.length,
                  itemBuilder: (_, index) {
                    final timer = listTimer[index];
                    return _Timer(
                      index: index,
                      timer: timer,
                    );
                  },
                  separatorBuilder: (_, index) =>
                      listTimer[index].time.rawTime.value != 0
                          ? const Divider()
                          : const SizedBox.shrink(),
                ),
              ),
              floatingActionButton: Container(
                padding: const EdgeInsets.only(left: 28),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${l10n.total}: ${listTimer.length}'.toUpperCase(),
                        style: textTheme.primaryStyle,
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => BlocProvider.value(
                                value: BlocProvider.of<TimerBloc>(context),
                                child: const NewTimerScreen(),
                              ),
                            ),
                          );
                        },
                        child: const Icon(Icons.add),
                      )
                    ]),
              ),
            );
          }
          return const Loading();
        },
      ),
    );
  }
}

class _Timer extends StatelessWidget {
  final int index;
  final TimerModel timer;
  const _Timer({
    required this.index,
    required this.timer,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return StreamBuilder<int>(
        stream: timer.time.rawTime,
        builder: (_, snap) {
          if (snap.hasData && snap.data! != 0) {
            final time = timer.isPaused ? l10n.paused : '${snap.data! ~/ 1000} sec';
            return ListTile(
              title: Text('${l10n.timer} ${timer.index}'),
              trailing: Text(
                time,
                style: AppTheme.of(context).textTheme.primaryStyle,
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        });
  }
}

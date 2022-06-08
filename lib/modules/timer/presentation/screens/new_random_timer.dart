import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_timer/modules/core/presentation/l10n/app_localizations.dart';
import 'package:test_timer/modules/core/presentation/theme/app_theme.dart';
import 'package:test_timer/modules/timer/presentation/bloc/timer_bloc.dart';

class NewTimerScreen extends StatelessWidget {
  const NewTimerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final appTheme = AppTheme.of(context);
    final colorsScheme = appTheme.colorsScheme;
    final textTheme = appTheme.textTheme;

    return WillPopScope(
      onWillPop: () async {
        context.read<TimerBloc>().add(AllTimersEvent());
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.newTimer.toUpperCase()),
        ),
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 70),
            child: InkWell(
              onTap: () => context.read<TimerBloc>().add(AddNewTimerEvent()),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 56,
                padding: const EdgeInsets.symmetric(vertical: 20),
                color: colorsScheme.red,
                child: Center(
                  child: Text(
                    l10n.startRandomTimer.toUpperCase(),
                    style: textTheme.primaryStyle.copyWith(color: colorsScheme.white),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

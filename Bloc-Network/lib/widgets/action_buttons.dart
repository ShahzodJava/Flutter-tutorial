import 'package:bloc_network/bloc/user_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user_bloc.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: () {
            userBloc.add(UserLoadEvent());
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.green
          ),
          child: const Text('Load'),
        ),
        const SizedBox(width: 10,),
        ElevatedButton(
          onPressed: () {
            userBloc.add(UserClearEvent());
          },
          style: ElevatedButton.styleFrom(
              primary: Colors.red
          ),
          child: const Text('Clear'),
        )
      ],
    );
  }
}

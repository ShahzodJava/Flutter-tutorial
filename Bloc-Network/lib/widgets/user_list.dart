import 'package:bloc_network/bloc/user_bloc.dart';
import 'package:bloc_network/bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (BuildContext context, UserState state) {
        if (state is UserLoadedState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Loaded'))
          );
        }
      },
      builder: (context, state) {
        if (state is UserEmptyState) {
          return const Center(child: Text('Not data found'));
        } else if (state is UserLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is UserLoadedState) {
          return ListView.builder(
            itemCount: state.loadedUser.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                color: index % 2 == 0 ? Colors.white : Colors.blue,
                child: ListTile(
                  leading: Text(
                    ' ID ${state.loadedUser[index].id ?? " "}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  title: Column(
                    children: [
                      Text(
                        'My name ${state.loadedUser[index].firstname}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Column(
                        children: [
                          Text(
                            'Email ${state.loadedUser[index].email}',
                            style: const TextStyle(fontStyle: FontStyle.italic),
                          ),
                          Text(
                            'Phone ${state.loadedUser[index].phone}',
                            style: const TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        }
        if (state is UserEmptyState) {
          return const Center(child: Text('Error occured'));
        }
        return const SizedBox.shrink();
      },
    );
  }
}

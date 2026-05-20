import 'package:flutter/material.dart';
import 'package:iqraamarktask/controller/users_controller.dart';
import 'package:provider/provider.dart';



class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<UsersController>();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        if (provider.users.isEmpty &&
            !provider.isLoading) {
          context
              .read<UsersController>()
              .initialize();
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("User List"),
      ),
      body: _buildBody(provider),
    );
  }

  Widget _buildBody(UsersController provider) {
    if (provider.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (provider.errorMessage.isNotEmpty) {
      return Center(
        child: Text(
          provider.errorMessage,
        ),
      );
    }

    return ListView.builder(
      itemCount: provider.users.length,
      itemBuilder: (context, index) {
        final user = provider.users[index];

        return Card(
          child: ListTile(
            title: Text(user.name),

            subtitle: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(user.email),
                Text(user.phone),
                Text(user.address.city),
                Text(user.company.name),
              ],
            ),

            trailing: Text(
              user.id.toString(),
            ),
          ),
        );
      },
    );
  }
}
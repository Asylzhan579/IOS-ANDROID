import 'package:flutter/material.dart';

import '../state/favorites_store.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  bool _notifications = true;
  bool _darkHint = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Center(
          child: CircleAvatar(
            radius: 48,
            child: Icon(Icons.person, size: 48),
          ),
        ),
        const SizedBox(height: 12),
        Center(
          child: Text('John Doe',
              style: Theme.of(context).textTheme.headlineSmall),
        ),
        const Center(child: Text('john.doe@example.com')),
        const SizedBox(height: 24),
        const Divider(),
        SwitchListTile(
          title: const Text('Notifications'),
          secondary: const Icon(Icons.notifications_outlined),
          value: _notifications,
          onChanged: (v) => setState(() => _notifications = v),
        ),
        SwitchListTile(
          title: const Text('Dark mode (demo)'),
          secondary: const Icon(Icons.dark_mode_outlined),
          value: _darkHint,
          onChanged: (v) => setState(() => _darkHint = v),
        ),
        ListTile(
          leading: const Icon(Icons.favorite_outline),
          title: const Text('Saved items'),
          trailing: ListenableBuilder(
            listenable: favorites,
            builder: (_, __) => Text('${favorites.items.length}'),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Log out'),
          onTap: () => ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Logged out (demo)')),
          ),
        ),
      ],
    );
  }
}

import 'package:babysitterapp/pages/available/available_page.dart';
import 'package:babysitterapp/pages/chat/chatpage.dart';
import 'package:babysitterapp/pages/homepage/notification_page.dart';
import 'package:babysitterapp/pages/location/babysitter_view_location.dart';
import 'package:babysitterapp/pages/profile/profilepage.dart';
import 'package:babysitterapp/pages/settings_page/settings_page.dart';
import 'package:babysitterapp/pages/transaction/transaction_history_page.dart';
import 'package:flutter/material.dart';

import 'babysitter_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final int _unreadNotifications = 4;

  List<Widget> _widgetOptions(BuildContext context) => [
        Center(
          child: Text(
            'Home Page',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        Center(
          child: Text(
            'Messages',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        Center(
          child: Text(
            'Map',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        Center(
          child: Text(
            'Profile',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const BabysitterViewLocation(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/male1.jpg'),
              ),
            ),
            const SizedBox(width: 10),
            Text('Hi, Sebastian', style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
        actions: [
          Icon(Icons.location_on, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 8),
          Text(
            'The current location is unknown',
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          ),
          const SizedBox(width: 8),
          Stack(
            clipBehavior: Clip.none,
            children: [
              IconButton(
                icon: Icon(Icons.notifications,
                    color: Theme.of(context).colorScheme.secondary),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NotificationPage(),
                    ),
                  );
                },
              ),
              if (_unreadNotifications > 0)
                Positioned(
                  right: 0,
                  top: 0,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.red,
                    child: Text(
                      '$_unreadNotifications',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text('Sebastian Abraham'),
              accountEmail: const Text('Parent / Babysitter'),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/male1.jpg'),
              ),
              decoration:
                  BoxDecoration(color: Theme.of(context).colorScheme.primary),
            ),
            ListTile(
              leading: Icon(Icons.home,
                  color: Theme.of(context).colorScheme.primary),
              title: Text('Homepage',
                  style: Theme.of(context).textTheme.bodyMedium),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.list,
                  color: Theme.of(context).colorScheme.primary),
              title: Text('Transaction History',
                  style: Theme.of(context).textTheme.bodyMedium),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TransactionHistoryPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications,
                  color: Theme.of(context).colorScheme.primary),
              title: Text('Notification',
                  style: Theme.of(context).textTheme.bodyMedium),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotificationPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.schedule,
                  color: Theme.of(context).colorScheme.primary),
              title: Text('Schedules',
                  style: Theme.of(context).textTheme.bodyMedium),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.calendar_month,
                  color: Theme.of(context).colorScheme.primary),
              title: Text('Availability',
                  style: Theme.of(context).textTheme.bodyMedium),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AvailabilityPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings,
                  color: Theme.of(context).colorScheme.primary),
              title: Text('Settings',
                  style: Theme.of(context).textTheme.bodyMedium),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsPage(),
                  ),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: Icon(Icons.help,
                  color: Theme.of(context).colorScheme.primary),
              title:
                  Text('Help', style: Theme.of(context).textTheme.bodyMedium),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Logout Account',
                  style: TextStyle(color: Colors.red)),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Theme.of(context).colorScheme.secondary,
              child: ListTile(
                leading: Icon(Icons.article,
                    color: Theme.of(context).colorScheme.onSecondary),
                title: Text(
                  'Overview',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
                subtitle: Text(
                  'Connects parents to local, background-checked babysitters...',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
                trailing: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.tertiary,
                  ),
                  child: Text('Read article',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onTertiary,
                      )),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Top rated',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Expanded(
              child: ListView(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const ProfilePage(
                                  babysitterId: "sample",
                                )),
                      );
                    },
                    child: const BabysitterCard(
                      name: 'Emma Gil',
                      rate: 'Php 200/hr',
                      rating: 4.3,
                      reviews: 90,
                      profileImage: 'assets/images/female1.jpg',
                    ),
                  ),
                  const BabysitterCard(
                    name: 'Ken Takakura',
                    rate: 'Php 200/hr',
                    rating: 4.7,
                    reviews: 140,
                    profileImage: 'assets/images/male3.jpg',
                  ),
                  const BabysitterCard(
                    name: 'Granny',
                    rate: 'Php 200/hr',
                    rating: 4.9,
                    reviews: 404,
                    profileImage: 'assets/images/female2.jpg',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.black,
        selectedItemColor: Theme.of(context).colorScheme.tertiary,
        unselectedItemColor: Colors.grey,
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: IconButton(
                icon: const Icon(Icons.message),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const ChatPage()),
                  );
                },
              ),
              label: 'Messages'),
          const BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Map'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:coffee_app/isar_db/coffee.dart';
import 'package:coffee_app/notification_controller.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:go_router/go_router.dart';

void main() async {
  await AwesomeNotifications().initialize(null, [
    NotificationChannel(
        channelKey: "basic_channel",
        channelName: "basic notification",
        channelDescription: "Test notification channel",
        channelGroupKey: "basic_channel_group")
  ], channelGroups: [
    NotificationChannelGroup(
      channelGroupKey: "basic_channel_group",
      channelGroupName: "basic channel group",
    )
  ]);

  bool isAllowed = await AwesomeNotifications().isNotificationAllowed();

  if (!isAllowed) {
    await AwesomeNotifications().requestPermissionToSendNotifications();
  }

  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [CoffeeSchema],
    directory: dir.path,
  );
  runApp(const Sandbox());
}

// GoRouter configuration
final _router = GoRouter(
  errorBuilder: (context, state) => const Scaffold(
    body: Center(
      child: Text('Page not found'),
    ),
  ),
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => const Home(),
    ),
    GoRoute(
      path: '/second',
      builder: (BuildContext context, GoRouterState state) =>
          const SecondScreen(),
    )
  ],
);

class Sandbox extends StatefulWidget {
  const Sandbox({super.key});

  @override
  State<Sandbox> createState() => _SandboxState();
}

class _SandboxState extends State<Sandbox> {
  @override
  void initState() {
    AwesomeNotifications().setListeners(
        onActionReceivedMethod:
            NotificationController.onNotificationReceivedMethod,
        onNotificationCreatedMethod:
            NotificationController.onNotificationCreatedMethod,
        onNotificationDisplayedMethod:
            NotificationController.onNotificationDisplayedMethod,
        onDismissActionReceivedMethod:
            NotificationController.onNotificationDismissedMethod);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Local Notifications'),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FlutterLogo(
              size: 100,
            ),
            const SizedBox(height: 20),
            const Text(
              'Local Notifications',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 40),
            NotificationButton(
              icon: Icons.notifications,
              label: 'Simple Notification',
              onPressed: () {
                AwesomeNotifications().createNotification(
                    content: NotificationContent(
                        id: 1,
                        channelKey: 'basic_channel',
                        title: "Simple Notification",
                        body: "Simple body"));
              },
            ),
           
          ],
        ),
      ),
    );
  }
}

class NotificationButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const NotificationButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 24),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
//Sample code for rows
 // return Scaffold(
    //     appBar: AppBar(
    //       title: const Text("Sandbox"),
    //       backgroundColor: Colors.grey,
    //     ),
    //     body: Row(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         crossAxisAlignment: CrossAxisAlignment.end,
    //         children: [
    //           Container(
    //             height: 400,
    //             color: Colors.red,
    //             child: Text("1"),
    //           ),
    //           Container(
    //             height: 200,
    //             color: Colors.green,
    //             child: Text("2"),
    //           ),
    //           Container(
    //             height: 150,
    //             color: Colors.grey,
    //             child: Text("3"),
    //           ),
    //           Container(
    //             height: 200,
    //             color: Colors.yellow,
    //             child: Text("4"),
    //           )
    //         ]));

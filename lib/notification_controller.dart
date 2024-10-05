import 'package:awesome_notifications/awesome_notifications.dart';

class NotificationController {
  //use this method when a new notificaiton in created

  @pragma('vm:entry-point')
  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {
    print('Notification created');
  }

  //use this method when a new notificaiton in displayed
  @pragma('vm:entry-point')
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    print('Notification displayed');
  }

  //use this method when a new notificaiton in dismissed
  @pragma('vm:entry-point')
  static Future<void> onNotificationDismissedMethod(
      ReceivedNotification receivedNotification) async {
    print('Notification dismissed');
  }

  //use this method when a new notificaiton in received
  @pragma('vm:entry-point')
  static Future<void> onNotificationReceivedMethod(
      ReceivedNotification receivedNotification) async {
    print('Notification received');
  }
}

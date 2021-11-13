import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:push_notifs_o2021/utils/constants_utils.dart';

/// Notificacion basica solo texto
/// El channel debe ser igual al de la inicializacion
Future<void> showBasicNotification(int id) async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: id,
      channelKey: channelSimpleId,
      title: simpleTitle,
      body: simpleDescr,
    ),
  );
}

/// Notificacion basica con icono a la derecha
/// payload es datos que pudieramos utilizar para algo
/// El channel debe ser igual al de la inicializacion
Future<void> showLargeIconNotification(int id) async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: id,
      channelKey: channelBigPictureId,
      title: bigPictureTitle,
      body: bigPictureDescr,
      largeIcon: iconExample,
      notificationLayout: NotificationLayout.BigPicture,
      payload: {'uuid': 'uuid-test'},
    ),
  );
}

Future<void> showBigPictureLargeIconNotification(int id) async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: id,
      channelKey: channelBigPictureId,
      title: bigPictureTitle,
      body: bigPictureDescr,
      largeIcon: iconExample,
      bigPicture: pictureExample,
      notificationLayout: NotificationLayout.BigPicture,
      payload: {'uuid': 'uuid-test'},
    ),
  );
}

Future<void> showBigPictureAndActionButtonsAndReplayNotification(int id) async {
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: id,
        channelKey: channelBigPictureId,
        title: bigPictureTitle,
        body: bigPictureDescr,
        largeIcon: iconExample,
        bigPicture: pictureExample,
        notificationLayout: NotificationLayout.BigPicture,
        payload: {'token': 'notificacion con acciones'},
      ),
      actionButtons: [
        NotificationActionButton(
          key: actionOneKey,
          label: actionOneTitle,
          buttonType: ActionButtonType.InputField,
        ),
        NotificationActionButton(
          key: actionTwoKey,
          label: actionTwoTitle,
          buttonType: ActionButtonType.Default,
        )
      ]);
}

Future<void> showRepeatNotification(int id) async {
  String localTimezone =
      await AwesomeNotifications().getLocalTimeZoneIdentifier();

  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: id,
      channelKey: channelScheduleId,
      title: scheduledTitle,
      body: scheduledDescr,
    ),
    schedule: NotificationInterval(
      interval: 60,
      timeZone: localTimezone,
      repeats: true,
    ),
  );
}

Future<void> cancelAllSchedules() async {
  await AwesomeNotifications().cancelAllSchedules();
}

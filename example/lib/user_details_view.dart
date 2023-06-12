import 'package:flutter/material.dart';
import 'package:flutter_telegram_web_app/flutter_telegram_web_app.dart' as tg;
import 'package:flutter_telegram_web_app/flutter_telegram_web_app.dart';
import 'package:flutter_telegram_web_example/common_widgets.dart';

class UserDetailsView extends StatefulWidget {
  const UserDetailsView({super.key});

  @override
  State<UserDetailsView> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetailsView> {
  final WebAppInitData webAppInitData = tg.initDataUnsafe;

  @override
  void initState() {
    tg.BackButton.show();
    super.initState();
  }

  @override
  void dispose() {
    tg.BackButton.hide();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            KDetailsList("Query", webAppInitData.query_id),
            KDetailsList("chat_type", webAppInitData.chat_type),
            KDetailsList("chat_instance", webAppInitData.chat_instance),
            KDetailsList("start_param", webAppInitData.start_param),
            KDetailsList("auth_date", webAppInitData.auth_date),
            KDetailsList("hash", webAppInitData.hash),
            KDetailsList("name",
                '${webAppInitData.user?.first_name} ${webAppInitData.user?.last_name}'),
            KDetailsList("username", webAppInitData.user?.username),
            KDetailsList("photoUrl", webAppInitData.user?.photo_url),
            KDetailsList(
                "receiver_username", webAppInitData.receiver?.username),
            KDetailsList("chat_username", webAppInitData.chat?.username),
            KDetailsList("chat_title", webAppInitData.chat?.title),
            KDetailsList("chat_url", webAppInitData.chat?.photo_url),
          ],
        ),
      ),
    );
  }
}

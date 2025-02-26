import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as auth;
import 'package:work_manager_server/mail.dart';

import 'src/generated/endpoints.dart';
import 'src/generated/protocol.dart';

void run(List<String> args) async {
  final pod = Serverpod(
    args,
    Protocol(),
    Endpoints(),
    authenticationHandler: auth.authenticationHandler,
  );
  auth.AuthConfig.set(
    auth.AuthConfig(
      onUserCreated: (session, userInfo) async {},
      sendValidationEmail: (session, email, validationCode) async {
        await sendMail(session, email, 'Register code', validationCode);
        return true;
      },
      sendPasswordResetEmail: (session, userInfo, validationCode) async {
        if (userInfo.email == null) throw 'No email';
        await sendMail(
            session, userInfo.email!, 'Register code', validationCode);
        return true;
      },
    ),
  );
  await pod.start();
}

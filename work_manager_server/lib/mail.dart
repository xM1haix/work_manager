import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:serverpod/serverpod.dart';

Future<SendReport> sendMail(
    Session session, String recipient, String subject, String body) async {
  final email = session.serverpod.getPassword('gmailEmail');
  final pass = session.serverpod.getPassword('gmailPassword');
  if (email == null || pass == null) throw "No credentials for email";
  return await send(
    Message()
      ..from = Address(email)
      ..recipients.add(Address(recipient))
      ..subject = subject
      ..text = body,
    gmail(email, pass),
  );
}

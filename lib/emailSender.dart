import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class EmailSender {

  static void send_mail(Email_subject subject, String message, String username1, String uid1, String username2, String uid2) async {

    //TODO add password
    String username = 'zacrubinzac@gmail.com';
    String password = '';

    final smtpServer = gmail(username, password);

    String subjectString = subject == Email_subject.bad_content ? 'Bad content Alarm' : "Scooter Alarm!";

    final message = new Message()
      ..from = new Address(username, 'Rollbrett Report')
      ..recipients.add(new Address('zacrubinzac@gmail.com'))
      ..subject = subjectString
      ..text = 'Marian [0123] reported Dirk [0123]'
      ..html = "<h1>" + subjectString + "</h1>\n<p> "+ username1 + " [" + uid1 +"]" + " reported " + username2 + " [" + uid2 + "]" + "</p>";


    try {
      final sendReport = await send(message, smtpServer, catchExceptions: true);
      print('Message sent: ' + sendReport.toString());
    } catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }

  }
}

enum Email_subject { scooter_content, bad_content }

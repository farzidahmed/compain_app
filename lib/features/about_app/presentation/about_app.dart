import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            _SectionTitle(title: 'About the App'),
            _SectionText(
              text:
                  'The Complaint & Suggestion Application is an independent platform created to help residents submit complaints or suggestions related to local public services, including police stations (thana) and ward or area-based issues.',
            ),
            SizedBox(height: 12),
            _SectionText(
              text:
                  'The app is designed to make it easier for users to organize and share their concerns or feedback. It does not require account creation or login, making it simple and accessible for everyone.',
            ),
            SizedBox(height: 12),
            _SectionText(
              text:
                  'This application does not provide official government services and does not guarantee any action by authorities.',
            ),
            SizedBox(height: 24),
            _SectionTitle(title: 'Source of Information'),
            SizedBox(height: 8),
            _LinkText(
              label: 'Bangladesh Police',
              url: 'https://www.police.gov.bd',
            ),
            SizedBox(height: 8),
            _LinkText(
              label: 'National Portal of Bangladesh',
              url: 'https://bangladesh.gov.bd',
            ),
            SizedBox(height: 24),
            _SectionTitle(title: 'Disclaimer'),
            SizedBox(height: 8),
            _SectionText(
              text:
                  'This application is not affiliated with, endorsed by, authorized by, or officially connected to any government entity, police department, or public authority. It is an independent platform and does not represent any government organization.',
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
    );
  }
}

class _SectionText extends StatelessWidget {
  final String text;
  const _SectionText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}

class _LinkText extends StatelessWidget {
  final String label;
  final String url;

  const _LinkText({required this.label, required this.url});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final Uri uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        }
      },
      child: Text(
        '$label ($url)',
        style: const TextStyle(
          color: Colors.blue,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}

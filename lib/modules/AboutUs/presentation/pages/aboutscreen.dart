
import 'package:flutter/material.dart';

class AboutPageView extends StatefulWidget {
  const AboutPageView({super.key});

  @override
  State<AboutPageView> createState() => _AboutPageViewState();
}

class _AboutPageViewState extends State<AboutPageView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Color(0xFFFFC107),
              padding: EdgeInsets.all(20.0),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'ABOUT US.',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Top 10 News is an analytics platform to help you stay informed with the latest news from around the globe. We provide a comprehensive overview of top stories, breaking news, and in-depth analyses presented in a beautiful and easy to use dashboard.',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[800],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    ClipOval(
                      child: Image.asset(
                        'asset/News vector background, breaking news_.jpeg',
                        height: 200,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  ResponsiveRow(
                    children: [
                      FeatureCard(
                        imagePath: 'asset/FAST NEWS.jpeg',
                        title: 'SUPER FAST',
                        description:
                            'Get the latest news at lightning speed, so you never miss out on important updates.',
                      ),
                      FeatureCard(
                        imagePath: 'asset/Focus Group Transcription Services _ 1-888-TYPE-IT-UP.jpeg',
                        title: 'FOR SUBSCRIBERS',
                        description:
                            'Exclusive content and features for our subscribers to stay ahead of the curve.',
                      ),
                      FeatureCard(
                        imagePath: 'asset/Free Vector _ People use smartphones to receive news in their daily life_.jpeg',
                        title: 'KEEP IT SIMPLE',
                        description:
                            'A beautifully designed interface to enhance your reading experience.',
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Our goal is to create easy-to-use news software that powerful and secure, designed for everyone who wants to stay informed.',
                            style: TextStyle(
                              fontSize: 18,
                              fontStyle: FontStyle.italic,
                              color: Colors.grey[800],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Shubham Jathar, CEO',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 9, 2, 1),
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Contact Us',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Email: contact@top10news.com',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[800],
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Phone: +1 234 567 890',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[800],
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Address: 123 News Street, Media City, Country',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[800],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResponsiveRow extends StatelessWidget {
  final List<Widget> children;

  ResponsiveRow({required this.children});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 600) {
      // For larger screens
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: children,
      );
    } else {
      // For smaller screens
      return Column(
        children: children,
      );
    }
  }
}

class FeatureCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  FeatureCard({
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          ClipOval(
            child: Image.asset(
              imagePath,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          SizedBox(height: 5),
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

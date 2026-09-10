import 'package:flutter/material.dart';

void main() {
  runApp(const NeerajPortfolioApp());
}

class NeerajPortfolioApp extends StatelessWidget {
  const NeerajPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'G Neeraj Portfolio',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4355B9),
        ),
        fontFamily: 'Arial',
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const HomePage(),
        '/about': (_) => const AboutPage(),
        '/projects': (_) => const ProjectsPage(),
      },
    );
  }
}

const primary = Color(0xFF4355B9);
const darkBlue = Color(0xFF31428F);
const lightPurple = Color(0xFFEEF0FA);

class PortfolioBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBack;

  const PortfolioBar({
    super.key,
    required this.title,
    this.showBack = false,
  });

  @override
  Size get preferredSize => const Size.fromHeight(62);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primary,
      foregroundColor: Colors.white,
      centerTitle: true,
      elevation: 2,
      leading: showBack
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            )
          : null,
      title: Text(
        title,
        style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pushReplacementNamed(context, '/'),
          child: const Text('Home', style: TextStyle(color: Colors.white)),
        ),
        TextButton(
          onPressed: () => Navigator.pushReplacementNamed(context, '/about'),
          child: const Text('About', style: TextStyle(color: Colors.white)),
        ),
        TextButton(
          onPressed: () => Navigator.pushReplacementNamed(context, '/projects'),
          child: const Text('Projects', style: TextStyle(color: Colors.white)),
        ),
        const SizedBox(width: 12),
      ],
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PortfolioBar(title: 'My Portfolio'),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 78,
                  backgroundColor: Color(0xFFE8DDFF),
                  child: Text(
                    'GN',
                    style: TextStyle(
                      color: primary,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'G. NEERAJ',
                  style: TextStyle(
                    color: darkBlue,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'B.Tech 3rd Year • Computer Science',
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                const Text(
                  "Hello! I'm G Neeraj, a passionate Computer Science Engineering "
                  'student who enjoys exploring modern technologies and building '
                  'creative digital projects that solve real-world problems.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, height: 1.6),
                ),
                const SizedBox(height: 28),
                Wrap(
                  spacing: 14,
                  runSpacing: 12,
                  alignment: WrapAlignment.center,
                  children: [
                    PortfolioButton(
                      text: 'About Me',
                      onPressed: () => Navigator.pushNamed(context, '/about'),
                    ),
                    PortfolioButton(
                      text: 'Projects',
                      onPressed: () => Navigator.pushNamed(context, '/projects'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final skills = [
      'Python', 'Java', 'C / C++', 'HTML & CSS', 'JavaScript',
      'Node.js', 'Database Concepts', 'Problem Solving',
      'Web Development', 'AI & Emerging Tech'
    ];

    return Scaffold(
      appBar: const PortfolioBar(title: 'About Me', showBack: true),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1100),
            child: Card(
              color: lightPurple,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 32,
                      backgroundColor: primary,
                      child: Text(
                        'GN',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                    const Text(
                      'About G Neeraj',
                      style: TextStyle(
                        color: darkBlue,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Hello! I'm G Neeraj, a Computer Science Engineering student "
                      'with an interest in software development, web technologies, '
                      'programming and emerging technologies.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, height: 1.6),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'I enjoy learning by building practical projects and turning '
                      'ideas into simple, useful digital experiences.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, height: 1.6),
                    ),
                    const SizedBox(height: 28),
                    const Text(
                      'Skills & Areas of Expertise',
                      style: TextStyle(
                        color: darkBlue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      alignment: WrapAlignment.center,
                      children: skills
                          .map((skill) => Chip(
                                label: Text(skill),
                                backgroundColor: Colors.white,
                                side: const BorderSide(
                                  color: Color(0xFFD9DDF1),
                                ),
                              ))
                          .toList(),
                    ),
                    const SizedBox(height: 28),
                    PortfolioButton(
                      text: 'Back to Home',
                      onPressed: () =>
                          Navigator.pushReplacementNamed(context, '/'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      (
        'AI',
        'Content Moderation System',
        'A Python-based intelligent tool for video content filtering and analysis.',
      ),
      (
        '☁',
        'Weather Forecast App',
        'A dynamic application built using Node.js and Java to display real-time weather data.',
      ),
      (
        '⌘',
        'Personal Portfolio Website',
        'A responsive multi-page portfolio showcasing my profile, skills and projects.',
      ),
    ];

    return Scaffold(
      appBar: const PortfolioBar(title: 'My Projects', showBack: true),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1100),
            child: Column(
              children: [
                ...projects.map(
                  (project) => Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 62,
                              height: 62,
                              decoration: BoxDecoration(
                                color: lightPurple,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                project.$1,
                                style: const TextStyle(
                                  color: primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    project.$2,
                                    style: const TextStyle(
                                      color: darkBlue,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    project.$3,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      height: 1.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                PortfolioButton(
                  text: 'Back to Home',
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, '/'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PortfolioButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const PortfolioButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: Colors.white,
        minimumSize: const Size(160, 46),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
      ),
    );
  }
}

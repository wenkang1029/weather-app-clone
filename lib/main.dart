import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(
          0xFF536878,
        ), // Slate blue-gray color
      ),
      home: const WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Rain background animation
          const RainBackground(),

          // Main content
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 24),

                // Location and current condition
                const Text(
                  'Austin',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const Text(
                  'Rain',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),

                // Current temperature
                const Text(
                  '76°',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 100,
                    fontWeight: FontWeight.w200,
                  ),
                ),

                const SizedBox(height: 16),

                // Today's high/low
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Tuesday',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.black26,
                      ),
                      child: const Text(
                        'TODAY',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Text('89', style: TextStyle(fontSize: 18)),
                    const Text(
                      ' | ',
                      style: TextStyle(fontSize: 18, color: Colors.white70),
                    ),
                    const Text(
                      '74',
                      style: TextStyle(fontSize: 18, color: Colors.white70),
                    ),
                    const SizedBox(width: 20),
                  ],
                ),

                const SizedBox(height: 8),

                // Hourly forecast
                Container(
                  height: 120,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.white24, width: 0.5),
                      bottom: BorderSide(color: Colors.white24, width: 0.5),
                    ),
                  ),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildHourlyForecast(
                        'Now',
                        Icons.cloud_queue,
                        '76°',
                        '30%',
                      ),
                      _buildHourlyForecast('10AM', Icons.flash_on, '79°', ''),
                      _buildHourlyForecast(
                        '11AM',
                        Icons.cloud_queue,
                        '82°',
                        '',
                      ),
                      _buildHourlyForecast(
                        '12PM',
                        Icons.cloud_queue,
                        '84°',
                        '',
                      ),
                      _buildHourlyForecast('1PM', Icons.cloud_queue, '87°', ''),
                      _buildHourlyForecast('2PM', Icons.cloud_queue, '87°', ''),
                      _buildHourlyForecast(
                        '3PM',
                        Icons.cloud_queue,
                        '88°',
                        '30%',
                      ),
                    ],
                  ),
                ),

                // Weekly forecast
                Expanded(
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      _buildWeeklyForecast(
                        'Wednesday',
                        Icons.flash_on,
                        '92',
                        '75',
                      ),
                      _buildWeeklyForecast(
                        'Thursday',
                        Icons.flash_on,
                        '92',
                        '74',
                      ),
                      _buildWeeklyForecast(
                        'Friday',
                        Icons.flash_on,
                        '90',
                        '73',
                      ),
                      _buildWeeklyForecast(
                        'Saturday',
                        Icons.wb_cloudy,
                        '89',
                        '73',
                      ),
                      _buildWeeklyForecast(
                        'Sunday',
                        Icons.wb_cloudy,
                        '90',
                        '74',
                      ),
                      _buildWeeklyForecast(
                        'Monday',
                        Icons.wb_sunny,
                        '90',
                        '74',
                      ),
                      _buildWeeklyForecast(
                        'Tuesday',
                        Icons.wb_sunny,
                        '91',
                        '73',
                      ),
                    ],
                  ),
                ),

                // Bottom bar with dots
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_on, size: 14, color: Colors.white),
                      const SizedBox(width: 12),
                      Container(
                        height: 6,
                        width: 6,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        height: 6,
                        width: 6,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        height: 6,
                        width: 6,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Icon(Icons.menu, size: 16, color: Colors.white),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHourlyForecast(
    String time,
    IconData icon,
    String temp,
    String precipitation,
  ) {
    return Container(
      width: 80,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(time, style: const TextStyle(fontSize: 16)),
          precipitation.isNotEmpty
              ? Text(
                precipitation,
                style: const TextStyle(fontSize: 14, color: Colors.lightBlue),
              )
              : const SizedBox(height: 14),
          Icon(icon, color: Colors.white, size: 24),
          Text(temp, style: const TextStyle(fontSize: 18)),
        ],
      ),
    );
  }

  Widget _buildWeeklyForecast(
    String day,
    IconData icon,
    String high,
    String low,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(day, style: const TextStyle(fontSize: 20)),
          ),
          Icon(icon, color: Colors.white, size: 24),
          const Spacer(flex: 1),
          Text(high, style: const TextStyle(fontSize: 20)),
          const SizedBox(width: 40),
          Text(
            low,
            style: const TextStyle(fontSize: 20, color: Colors.white70),
          ),
        ],
      ),
    );
  }
}

class RainBackground extends StatefulWidget {
  const RainBackground({super.key});

  @override
  State<RainBackground> createState() => _RainBackgroundState();
}

class _RainBackgroundState extends State<RainBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<RainDrop> _raindrops = [];
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();

    // Create raindrops
    for (int i = 0; i < 100; i++) {
      _raindrops.add(
        RainDrop(
          x: _random.nextDouble() * 400,
          y: _random.nextDouble() * 800,
          length: _random.nextDouble() * 15 + 5,
          speed: _random.nextDouble() * 10 + 5,
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        // Update raindrops position
        for (var drop in _raindrops) {
          drop.y += drop.speed;
          if (drop.y > MediaQuery.of(context).size.height) {
            drop.y = 0;
            drop.x = _random.nextDouble() * MediaQuery.of(context).size.width;
          }
        }

        return CustomPaint(
          size: Size.infinite,
          painter: RainPainter(raindrops: _raindrops),
        );
      },
    );
  }
}

class RainDrop {
  double x;
  double y;
  double length;
  double speed;

  RainDrop({
    required this.x,
    required this.y,
    required this.length,
    required this.speed,
  });
}

class RainPainter extends CustomPainter {
  final List<RainDrop> raindrops;

  RainPainter({required this.raindrops});

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colors.white.withOpacity(0.3)
          ..strokeWidth = 1
          ..strokeCap = StrokeCap.round;

    for (var drop in raindrops) {
      canvas.drawLine(
        Offset(drop.x, drop.y),
        Offset(drop.x, drop.y + drop.length),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

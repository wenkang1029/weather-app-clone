# Weather App Clone 🌧️

A beautiful Flutter weather application featuring animated rain effects and a clean, modern UI design.

## Features

- **Real-time Rain Animation**: Custom-painted rain drops with realistic physics
- **Modern UI Design**: Clean interface with a slate blue-gray theme
- **Weather Information Display**:
  - Current temperature and location
  - Hourly forecast (scrollable)
  - 7-day weekly forecast
  - Weather condition indicators
- **Responsive Design**: Optimized for different screen sizes
- **Smooth Animations**: 60fps rain animation with performance optimization

## Screenshots

<!-- Add your app screenshots here -->
*Screenshots coming soon...*

## Getting Started

### Prerequisites

- Flutter SDK (>=3.0.0)
- Dart SDK (>=2.17.0)
- Android Studio / VS Code
- Git

### Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/weather-app-clone.git
```

2. Navigate to the project directory:
```bash
cd weather-app-clone
```

3. Install dependencies:
```bash
flutter pub get
```

4. Run the app:
```bash
flutter run
```

## Project Structure

```
lib/
├── main.dart           # Main application entry point
├── screens/           # Screen widgets (if you expand)
├── widgets/           # Reusable widgets (if you expand)
└── models/            # Data models (if you expand)
```

## Technical Implementation

### Rain Animation System
- **Custom Painter**: Uses Flutter's `CustomPainter` to draw rain drops
- **Animation Controller**: Manages 60fps animation loop
- **Physics Simulation**: Realistic raindrop movement with varying speeds
- **Performance Optimized**: Efficient rendering for 100+ raindrops

### Key Components

- **RainBackground**: Stateful widget managing rain animation
- **RainPainter**: Custom painter for rendering raindrops
- **RainDrop**: Model class for individual raindrop properties
- **WeatherScreen**: Main UI layout and weather data display

## Customization

### Changing Rain Properties
```dart
// In _RainBackgroundState.initState()
for (int i = 0; i < 100; i++) { // Change number of raindrops
  _raindrops.add(
    RainDrop(
      length: _random.nextDouble() * 15 + 5, // Adjust length
      speed: _random.nextDouble() * 10 + 5,  // Adjust speed
    ),
  );
}
```

### Modifying Colors
```dart
// In main.dart MyApp theme
theme: ThemeData.dark().copyWith(
  scaffoldBackgroundColor: const Color(0xFF536878), // Change background
),
```

## Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  # Add additional dependencies as needed
```

## Platform Support

- ✅ Android
- ✅ iOS
- ✅ Web
- ✅ Windows
- ✅ macOS
- ✅ Linux

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## Future Enhancements

- [ ] Real weather API integration
- [ ] Location-based weather data
- [ ] Multiple weather animations (snow, sun, clouds)
- [ ] Dark/Light theme toggle
- [ ] Weather alerts and notifications
- [ ] Detailed weather metrics

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Flutter team for the amazing framework
- Weather app design inspiration from iOS Weather app
- Custom animation techniques from Flutter documentation

## Contact

Your Name - [@yourtwitter](https://twitter.com/yourtwitter) - your.email@example.com

Project Link: [https://github.com/yourusername/weather-app-clone](https://github.com/yourusername/weather-app-clone)

---

⭐ Don't forget to star this repository if you found it helpful!
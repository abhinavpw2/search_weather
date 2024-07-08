# Weather Flutter App

Welcome to the Weather Flutter App! This app provides current weather information for any location in the world. It is built using Flutter and leverages a weather API to fetch real-time weather data.

## Features

- Current weather information
- Temperature in Celsius
- Weather conditions (e.g., sunny, cloudy, rainy)
- Humidity and wind speed
- Search for weather by city name
- Responsive design for both mobile and tablet

## Getting Started

### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install) installed on your machine
- An API key from a weather service provider (e.g., OpenWeatherMap)

### Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/yourusername/search_weather.git
   cd search_weather/weather_app
   ```

2. **Get the dependencies:**

   ```bash
   flutter pub get
   ```

   
3. **Add your API key:**

   Open the `search_weather/weather_app/lib/services/services.dart` file and replace `YOUR_API_KEY` with your actual API key.

   ```dart
   final String apiKey = 'YOUR_API_KEY';
   ```

4. **Run the app:**

   ```bash
   flutter run
   ```
   
### APK File

You can directly download and install the APK file located in the root directory of this repository. The file is named `app-release.apk`.

## Usage

1. Open the app on your device.
2. Enter the name of the city you want to check the weather for in the search bar.
3. The app will display the current weather information for the specified city.

## Built With

- [Flutter](https://flutter.dev/) - The framework used
- [OpenWeatherMap API](https://openweathermap.org/api) - Weather data provider

## Contact

Abhinav Pawar - abhinavpw2@gmail.com

Project Link: [https://github.com/yourusername/search_weather](https://github.com/yourusername/search_weather)

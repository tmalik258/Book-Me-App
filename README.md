# Booking App

A Flutter application for booking travel accommodations, including flights, hotels, and other services. The app includes a simple navigation structure with various screens for home, coupons, trips, search, and settings.

## Table of Contents

- [Features](#features)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Usage](#usage)
- [Project Structure](#project-structure)
- [Screens and Navigation](#screens-and-navigation)
- [Customization](#customization)
- [Contributing](#contributing)
- [License](#license)

## Features

- **Splash Screen**: A loading animation screen displayed when the app starts.
- **Login and Sign-Up Screens**: Allows users to log in or sign up to access the app.
- **Bottom Navigation Bar**: Enables easy navigation between Home, Coupons, My Trips, Search, and Settings screens.
- **Responsive Design**: Compatible with both Android and iOS.

## Getting Started

Follow these instructions to set up and run the project on your local machine.

### Prerequisites

- **Flutter SDK**: Follow the installation guide [here](https://flutter.dev/docs/get-started/install).
- **IDE**: You can use Android Studio, Visual Studio Code, or any other IDE compatible with Flutter.

### Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/tmalik258/book-me-app.git
   cd book-me-app
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run the application**:
   ```bash
   flutter run
   ```

   Make sure you have an emulator or a connected device for testing.

## Usage

- Launch the app on your device.
- On the splash screen, wait for the animation to finish.
- Use the login or sign-up screen to access the app.
- Navigate between different sections using the bottom navigation bar.

## Project Structure

```
booking_app/
├── android/                  # Android-specific files
├── ios/                      # iOS-specific files
├── lib/                      # Main code directory
│   ├── main.dart             # App entry point
│   ├── mainscreen.dart       # Main screen with bottom navigation
│   ├── login.dart            # Login screen
│   ├── signup.dart           # Sign-up screen
│   ├── home.dart             # Home screen widget
│   ├── coupon.dart           # Coupon screen widget
│   ├── mytrips.dart          # My Trips screen widget
│   ├── searchpage.dart       # Search page widget
│   ├── widgets/              # Additional widgets like splash screen
│   │	└── splash_screen.dart    # Splash screen widget
├── pubspec.yaml              # Project dependencies and metadata
└── README.md                 # Project README file
```

## Screens and Navigation

- **Splash Screen**: An initial screen with an animated loading indicator.
- **Login Screen**: A screen for user authentication.
- **Sign-Up Screen**: Allows new users to register.
- **Home Screen**: Displays booking options and travel recommendations.
- **Coupons Screen**: Shows available coupons and offers.
- **My Trips Screen**: Allows users to view and manage their bookings.
- **Search Screen**: Provides search functionality to explore available travel options.
- **Settings Screen**: Placeholder screen for app settings.

The **Bottom Navigation Bar** includes:

1. **Home** - Takes users to the main screen with booking options.
2. **Coupons** - Shows available deals and offers.
3. **My Trips** - Displays the user's bookings.
4. **Search** - Allows users to search for destinations.
5. **Settings** - Placeholder for app settings.

## Customization

To customize this app:

- **Theme**: Modify the theme in `main.dart` by adjusting `primarySwatch` and `scaffoldBackgroundColor`.
- **Navigation Bar Colors**: Change selected and unselected item colors in `mainscreen.dart` inside the `_MainScreenState` class.

## Contributing

Contributions are welcome! If you’d like to make changes, please fork this repository and create a pull request with a detailed explanation of your changes.

## License

This project is open source and available under the [MIT License](LICENSE).
# Flutter Firebase CRUD with Authentication

A Flutter application that demonstrates CRUD (Create, Read, Update, Delete) operations using Firebase as the backend, complete with user authentication. This project serves as a template for building production-ready Flutter applications with Firebase integration.

## Features

- **User Authentication**
  - Email/Password Sign In
  - User Registration
  - Secure Session Management

- **Data Management**
  - Create new records
  - Read and display data
  - Update existing records
  - Delete records
  - Real-time data synchronization

- **Responsive UI**
  - Clean and intuitive interface
  - Form validation
  - Error handling
  - Loading states

## Prerequisites

- Flutter SDK (latest stable version)
- Dart SDK (latest stable version)
- Firebase account
- Android Studio / Xcode (for emulator/simulator)
- VS Code or Android Studio (recommended IDEs)

## Setup Instructions

### 1. Clone the repository
```bash
git clone <repository-url>
cd crud_firebase
```

### 2. Install Dependencies
```bash
flutter pub get
```

### 3. Firebase Configuration

1. Go to the [Firebase Console](https://console.firebase.google.com/)
2. Create a new project or select an existing one
3. Add a new Flutter app to your Firebase project
4. Follow the setup instructions to add Firebase to your Flutter app
5. Download the `google-services.json` (Android) and `GoogleService-Info.plist` (iOS) files
6. Place the configuration files in the appropriate locations:
   - Android: `android/app/google-services.json`
   - iOS: `ios/Runner/GoogleService-Info.plist`

### 4. Enable Authentication Methods
1. In Firebase Console, go to Authentication > Sign-in method
2. Enable Email/Password authentication

### 5. Set Up Firestore Database
1. In Firebase Console, go to Firestore Database
2. Click "Create database"
3. Start in test mode (for development) or production mode
4. Choose a location for your database

### 6. Update Security Rules (Optional)
If you want to secure your database, update the Firestore security rules according to your requirements.

## Running the App

### For Android
```bash
flutter run -d chrome
# or for physical device/emulator
flutter run
```

### For iOS
```bash
flutter run -d chrome
# or for simulator/physical device
flutter run
```

## Project Structure

```
lib/
├── main.dart               # Application entry point
├── pages/                 # Application screens
│   ├── home.dart          # Main screen showing data list
│   ├── login.dart         # User login screen
│   ├── register.dart      # User registration screen
│   ├── add_data.dart      # Add new record screen
│   └── edit_data.dart     # Edit existing record screen
└── services/             # Business logic and services
    ├── firebase_auth.dart # Authentication service
    └── database_service.dart # Database operations
```

## Dependencies

- firebase_core: ^2.24.2
- firebase_auth: ^4.15.3
- cloud_firestore: ^4.13.6
- provider: ^6.1.1
- fluttertoast: ^8.2.4

## Troubleshooting

- **Firebase not initialized**
  - Make sure you've followed all Firebase setup steps
  - Verify your `google-services.json` or `GoogleService-Info.plist` is in the correct location

- **Authentication issues**
  - Ensure Email/Password authentication is enabled in Firebase Console
  - Check your internet connection

- **Database permission errors**
  - Verify your Firestore security rules
  - Make sure you're authenticated before accessing protected routes

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

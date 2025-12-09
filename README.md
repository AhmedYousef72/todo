# 📝 Todo App - Flutter & Firebase

A full-featured, production-ready **Todo/Task Management Application** built with **Flutter**, **Firebase**, and **Provider state management**. Features comprehensive dark mode support, multi-language localization, and a beautiful Material Design UI.

![Flutter](https://img.shields.io/badge/Flutter-3.0%2B-blue?style=flat&logo=flutter)
![Dart](https://img.shields.io/badge/Dart-2.18%2B-blue?style=flat&logo=dart)
![Firebase](https://img.shields.io/badge/Firebase-Latest-orange?style=flat&logo=firebase)
![License](https://img.shields.io/badge/License-MIT-green?style=flat)

---

## ✨ Features

### 🎯 Core Functionality
- ✅ **Task Management** — Create, edit, update, and delete tasks
- ✅ **Date-based Organization** — View tasks by selected date with interactive timeline
- ✅ **Task Status Tracking** — Mark tasks as done with visual indicators
- ✅ **Real-time Sync** — All data synced with Firebase Firestore
- ✅ **User Authentication** — Secure login/signup with Firebase Auth

### 🌙 Dark Mode & Theming
- ✅ **Light & Dark Themes** — Toggle between light (#DFECDB) and dark (#060E1E) modes
- ✅ **Persistent Theme** — Theme preference saved locally
- ✅ **Smart Color Palette** — Optimized colors for both light and dark modes
  - Primary: #5D9CEC (AppBar, selected states)
  - Dark Container: #141922 (navigation, cards in dark mode)
  - Text: Black on white inputs, white on dark backgrounds

### 🌍 Internationalization
- ✅ **Multi-Language Support** — Arabic & English
- ✅ **Runtime Language Switch** — Change language instantly in Settings
- ✅ **Persistent Locale** — Language preference remembered across sessions
- ✅ **Easy Localization Integration** — All UI strings translated

### 📱 UI/UX
- ✅ **Material Design 3** — Modern, responsive Material Design
- ✅ **Smooth Animations** — Polished transitions and interactions
- ✅ **Date Timeline Picker** — Easy-to-use date selection with `easy_date_timeline`
- ✅ **Bottom Sheets** — Theme & language selection UI
- ✅ **Responsive Layout** — Adapts to all screen sizes
- ✅ **Slide Actions** — Swipeable task cards with `flutter_slidable`

---

## 🏗️ Project Architecture

### Tech Stack
```
Frontend:
  • Flutter 3.0+ (Cross-platform mobile framework)
  • Dart 2.18+ (Programming language)
  • Provider 6.1.5+ (State management)

Backend:
  • Firebase Auth (Authentication)
  • Cloud Firestore (Real-time database)
  • Firebase Core (Firebase initialization)

UI Libraries:
  • EasyLocalization 3.0.8 (Internationalization)
  • easy_date_timeline 2.0.9 (Date picker)
  • flutter_slidable 4.0.3 (Swipe actions)

Local Storage:
  • SharedPreferences 2.5.4 (Key-value persistence)
```

### Project Structure
```
lib/
├── main.dart                          # App entry point, theme setup
├── app_colors.dart                    # Centralized color definitions
├── home_screen.dart                   # Main screen with bottom nav
├── task_item.dart                     # Individual task card widget
│
├── models/                            # Data models
│   ├── task_model.dart               # Task data structure
│   └── user_model.dart               # User profile data
│
├── providers/
│   └── my_provider.dart              # Provider for theme & locale state
│
├── tabs/
│   ├── tasks.dart                    # Task list with date timeline
│   ├── editTask_screen.dart          # Task creation/editing
│   └── settings.dart                 # Settings & preferences
│
├── register/
│   ├── login.dart                    # Login screen
│   └── signUp.dart                   # Sign-up screen
│
├── bottom_sheets/
│   ├── add_task_bottom_sheet.dart   # Add task UI
│   ├── theme_bottomsheet.dart       # Theme selector
│   └── language_bottomsheet.dart    # Language selector
│
├── utils/
│   └── my_theme_data.dart           # Light & dark theme definitions
│
└── firebase_*.dart
    ├── firebase_functions.dart      # Firestore queries & operations
    ├── firebase_options.dart        # Firebase config
    └── firebase_core setup          # Firebase initialization

assets/
├── images/                            # App images & icons
└── translations/
    ├── en.json                       # English strings
    └── ar.json                       # Arabic strings
```

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK 3.0+
- Dart 2.18+
- iOS 11+ or Android 5.0+ (API 21+)
- Firebase project setup (see below)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/AhmedYousef72/todo.git
   cd todo
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Set up Firebase**
   - Create a Firebase project at [Firebase Console](https://console.firebase.google.com)
   - Add Android app and download `google-services.json` → place in `android/app/`
   - Add iOS app and download `GoogleService-Info.plist` → place in `ios/Runner/`
   - Enable Firebase Auth (Email/Password)
   - Create a Firestore database (start in test mode for development)

4. **Run the app**
   ```bash
   flutter run
   ```

---

## 🎨 Dark Mode & Theming

### How It Works
- **Light Mode**: Soft green scaffold (#DFECDB) with white cards and blue AppBar
- **Dark Mode**: Deep blue/black scaffold (#060E1E) with dark containers (#141922) and consistent blue AppBar

### Switching Themes
1. Tap **Settings** in the bottom navigation
2. Tap **Theme** section
3. Choose **Light** or **Dark**
4. Theme persists automatically

### Color System
```dart
// lib/app_colors.dart
class AppColors {
  static const Color primary = Color(0xFF5D9CEC);           // Blue (AppBar, selected)
  static const Color scaffoldDark = Color(0xFF060E1E);      // Very dark blue (bg)
  static const Color bottomSheetDark = Color(0xFF141922);   // Dark container
  static const Color navBarLight = Colors.white;
  static const Color selectedIcon = Color(0xFF5D9CEC);
  static const Color unselectedIcon = Color(0xFFC8C9CB);
  // ... more colors
}
```

---

## 🌐 Localization

### Supported Languages
- **English** (en)
- **العربية** (ar)

### How to Change Language
1. Open **Settings**
2. Tap **Language** section
3. Choose **English** or **العربية**
4. Language persists across sessions

### Adding New Languages
1. Create a new JSON file in `assets/translations/` (e.g., `fr.json`)
2. Add translated strings matching the structure of `en.json`
3. Update `main.dart` to include the locale:
   ```dart
   supportedLocales: [
     Locale('en'),
     Locale('ar'),
     Locale('fr'),  // New language
   ]
   ```

---

## 📝 Usage

### Creating a Task
1. Tap the **+ (Add)** button in the center-bottom
2. Enter task title and description
3. Tap **Save**

### Editing a Task
1. Tap on any task card
2. Update title/description
3. Tap **Update** to save changes

### Deleting a Task
1. Swipe left on a task card (using flutter_slidable)
2. Tap the delete icon
3. Confirm deletion

### Marking Tasks as Done
1. Check the checkbox on the task card
2. Task will show as completed with strikethrough

### Selecting a Date
1. Use the interactive date timeline at the top of Tasks tab
2. Tap any date to view/create tasks for that date
3. Selected date shows with blue highlight

---

## 🔐 Authentication

### Sign Up
- Create account with email and password
- Password validation included
- User profile created in Firestore

### Login
- Sign in with registered email/password
- Session persists until logout
- Secure Firebase Authentication

### Logout
- Tap the **Logout icon** (arrow) in the top-right AppBar
- Redirected to login screen
- All local preferences preserved

---

## 🔄 State Management with Provider

### MyProvider
Manages global app state:
```dart
class MyProvider extends ChangeNotifier {
  ThemeMode _mode = ThemeMode.light;
  Locale _locale = Locale('en');
  UserModel? _userModel;

  // Getters
  ThemeMode get mode => _mode;
  Locale get locale => _locale;
  UserModel? get userModel => _userModel;

  // Methods
  void changeTheme(ThemeMode mode) { ... }
  void changeLanguage(Locale locale) { ... }
  void setUserModel(UserModel user) { ... }
}
```

### Usage in Widgets
```dart
// Listen to theme changes
Consumer<MyProvider>(
  builder: (context, provider, _) {
    return Scaffold(
      backgroundColor: provider.mode == ThemeMode.dark 
        ? AppColors.scaffoldDark 
        : Colors.white,
    );
  },
)
```

---

## 📂 Firebase Integration

### Firestore Collections
```
users/
  └── {uid}
      ├── username
      ├── email
      └── createdAt

tasks/
  └── {uid}
      └── {taskId}
          ├── title
          ├── subTitle
          ├── date
          ├── isDone
          └── createdAt
```

### Key Functions (lib/firebase_functions.dart)
```dart
// Get all tasks for a specific user and date
Stream<QuerySnapshot> getTask(DateTime date) { ... }

// Add new task
Future<void> addTask(TaskModel task) { ... }

// Update task
Future<void> updateTask(TaskModel task) { ... }

// Delete task
Future<void> deleteTask(String taskId) { ... }

// Get current user profile
Future<UserModel> getCurrentUser() { ... }
```

---

## 🧪 Testing & Deployment

### Local Testing
```bash
# Run the app
flutter run

# Run in release mode (optimized performance)
flutter run --release

# Run on specific device
flutter run -d <device-id>
```

### Building APK (Android)
```bash
flutter build apk --release
# Output: build/app/outputs/flutter-apk/app-release.apk
```

### Building App Bundle (Google Play Store)
```bash
flutter build appbundle --release
# Output: build/app/outputs/bundle/release/app-release.aab
```

### Building iOS App
```bash
flutter build ios --release
```

---

## 🐛 Troubleshooting

### Firebase Connection Issues
- Verify Google Services files are in correct locations
- Check Firebase project has Firestore and Auth enabled
- Ensure app is registered in Firebase Console

### Dark Mode Not Saving
- Check SharedPreferences permissions
- Verify `MyProvider` is initialized in `main.dart`

### Localization Strings Not Showing
- Ensure translation JSON files are in `assets/translations/`
- Verify `pubspec.yaml` includes `assets:` folder
- Check language code matches locale definition

### Task Not Syncing
- Verify user is authenticated
- Check Firestore Security Rules allow read/write
- Ensure internet connection is active

---

## 📱 Screenshots & Demo

### Light Mode
- Clean green interface with blue accents
- Excellent readability in daylight
- Professional appearance

### Dark Mode
- Comfortable deep blue/black theme
- Reduced eye strain in low-light conditions
- Maintains excellent contrast ratios

### Multi-Language
- Instant language switching
- RTL support for Arabic
- All UI strings localized

---

## 🔄 Version History

### v1.0.0 (Current)
- ✅ Full task management system
- ✅ Firebase authentication & Firestore
- ✅ Dark mode with persistent theme
- ✅ Multi-language localization (EN/AR)
- ✅ Responsive Material Design UI
- ✅ Date timeline with task filtering
- ✅ Swipeable task actions

---

## 📄 License

This project is licensed under the **MIT License** - see the LICENSE file for details.

---

## 👨‍💻 Author

**Ahmed Yousef**
- GitHub: [@AhmedYousef72](https://github.com/AhmedYousef72)
- Portfolio: [Your Portfolio](https://your-portfolio.com)

---

## 🙏 Acknowledgments

- **Flutter Team** for the amazing framework
- **Firebase** for backend services
- **EasyLocalization** for localization library
- **Provider** for state management
- **Material Design** for design guidelines

---

## 📞 Support

For issues, questions, or feature requests, please [open an issue](https://github.com/AhmedYousef72/todo/issues) on GitHub.

---

## 📚 Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Firebase Documentation](https://firebase.google.com/docs)
- [Material Design](https://material.io/design)
- [Provider Package](https://pub.dev/packages/provider)
- [EasyLocalization](https://pub.dev/packages/easy_localization)

---

**Happy Coding! 🚀**

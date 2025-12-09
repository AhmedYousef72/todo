# 📝 Todo App - Flutter & Firebase

A full-featured, production-ready **Todo/Task Management Application** built with **Flutter**, **Firebase**, and **Provider state management**. Features comprehensive dark mode support, multi-language localization, and a beautiful Material Design UI.

![Flutter](https://img.shields.io/badge/Flutter-3.0%2B-blue?style=flat&logo=flutter)
![Dart](https://img.shields.io/badge/Dart-2.18%2B-blue?style=flat&logo=dart)
![Firebase](https://img.shields.io/badge/Firebase-Latest-orange?style=flat&logo=firebase)
![License](https://img.shields.io/badge/License-MIT-green?style=flat)

---

## 🎨 Design

This app is built based on a professional Figma design:

**[📐 View Figma Design](https://www.figma.com/design/SqoFWFlTZmRYjYYKmp81x1/ToDo-App--Copy-?node-id=3-2&t=pbVmhZawCtMrOeeB-1)**

---

## ✨ Features

### 🎯 Core Functionality
- ✅ **Task Management** — Create, edit, update, and delete tasks
- ✅ **Date-based Organization** — View tasks by selected date with interactive timeline
- ✅ **Task Status Tracking** — Mark tasks as done with visual indicators
- ✅ **Real-time Sync** — All data synced with Firebase Firestore
- ✅ **User Authentication** — Secure login/signup with email verification

### 🌙 Dark Mode & Theming
- ✅ **Light & Dark Themes** — Toggle between light and dark modes
- ✅ **Persistent Theme** — Theme preference saved locally
- ✅ **Smart Color Palette** — Optimized colors for both modes
  - Primary: #5D9CEC (AppBar, selected states)
  - Dark Background: #060E1E
  - Dark Container: #141922

### 🌍 Internationalization
- ✅ **Multi-Language Support** — Arabic & English
- ✅ **Runtime Language Switch** — Change language instantly in Settings
- ✅ **RTL Support** — Full right-to-left layout for Arabic
- ✅ **Persistent Locale** — Language preference remembered across sessions

### 📱 UI/UX
- ✅ **Material Design 3** — Modern, responsive Material Design
- ✅ **Smooth Animations** — Polished transitions and interactions
- ✅ **Date Timeline Picker** — Interactive date selection
- ✅ **Bottom Sheets** — Elegant theme & language selection UI
- ✅ **Slide Actions** — Swipeable task cards for quick delete/edit

---

## 🏗️ Tech Stack

```
Frontend:
  • Flutter 3.0+
  • Dart 2.18+
  • Provider 6.1.5+ (State management)

Backend:
  • Firebase Auth (Authentication)
  • Cloud Firestore (Real-time database)

UI Libraries:
  • EasyLocalization 3.0.8
  • easy_date_timeline 2.0.9
  • flutter_slidable 4.0.3

Local Storage:
  • SharedPreferences 2.5.4
```

---

## 📂 Project Structure

```
lib/
├── main.dart                          # App entry point
├── home_screen.dart                   # Main screen with bottom navigation
├── task_item.dart                     # Task card widget
│
├── models/
│   ├── task_model.dart               # Task data structure
│   └── user_model.dart               # User profile data
│
├── providers/
│   └── my_provider.dart              # State management (theme, locale, user)
│
├── tabs/
│   ├── tasks.dart                    # Task list with date timeline
│   ├── editTask_screen.dart          # Task editing
│   └── settings.dart                 # Settings screen
│
├── register/
│   ├── login.dart                    # Login screen
│   └── signUp.dart                   # Sign-up screen
│
├── bottom_sheets/
│   ├── add_task_bottom_sheet.dart
│   ├── theme_bottomsheet.dart
│   └── language_bottomsheet.dart
│
├── utils/
│   ├── my_theme_data.dart           # Theme definitions
│   └── app_colors.dart              # Color constants
│
└── firebase_functions.dart           # Firebase operations

assets/
└── translations/
    ├── en.json                       # English strings
    └── ar.json                       # Arabic strings
```

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK 3.0+
- Dart 2.18+
- Firebase account

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
   - Add Android app → download `google-services.json` → place in `android/app/`
   - Add iOS app → download `GoogleService-Info.plist` → place in `ios/Runner/`
   - Enable **Firebase Authentication** (Email/Password)
   - Create **Cloud Firestore** database
   - Update Firestore Security Rules:
     ```javascript
     rules_version = '2';
     service cloud.firestore {
       match /databases/{database}/documents {
         match /Users/{userId} {
           allow read, write: if request.auth != null && request.auth.uid == userId;
         }
         match /Tasks/{taskId} {
           allow read, write: if request.auth != null;
         }
       }
     }
     ```

4. **Run the app**
   ```bash
   flutter run
   ```
---

## 📝 Usage

### Task Management
- **Create**: Tap the + button, enter details, and save
- **Edit**: Tap any task card to modify
- **Delete**: Swipe left on a task card
- **Mark Done**: Tap the checkmark button on the task
- **Filter by Date**: Select dates from the timeline picker

### Settings
- **Change Theme**: Settings → Theme → Select Light/Dark
- **Change Language**: Settings → Language → Select English/العربية

### Authentication
- **Sign Up**: Provide name, email, phone, age, and password
- **Login**: Enter email and password
- **Logout**: Tap logout icon in AppBar

---

## 📂 Firebase Structure

### Firestore Collections
```
Users/
  └── {userId}
      ├── Username: string
      ├── email: string
      ├── phone: string
      └── age: number

Tasks/
  └── {taskId}
      ├── id: string
      ├── userId: string
      ├── title: string
      ├── subTitle: string
      ├── date: number (timestamp)
      └── isDone: boolean
```

### Key Functions
```dart
// Authentication
static Future<void> createAccount(email, password, ...)
static Future<void> login(email, password, ...)

// Task Operations
static Stream<QuerySnapshot<TaskModel>> getTask(DateTime date)
static Future<void> addTask(TaskModel task)
static Future<void> updateTask(TaskModel task)
static Future<void> deleteTask(String taskId)

// User Operations
static Future<void> addUser(UserModel userModel)
```

---

## 🧪 Building & Deployment

### Testing
```bash
flutter run                    # Debug mode
flutter run --release          # Release mode
flutter analyze                # Check for issues
```

### Android
```bash
# APK
flutter build apk --release

# App Bundle (Play Store)
flutter build appbundle --release
```

### iOS
```bash
flutter build ios --release
```

---

## 🐛 Troubleshooting

### Firebase Connection Issues
- Verify `google-services.json` and `GoogleService-Info.plist` are in correct locations
- Ensure Firebase project has Auth and Firestore enabled
- Check app package name matches Firebase Console

### Theme/Language Not Persisting
- Verify SharedPreferences is properly initialized
- Ensure `MyProvider` is wrapped around MaterialApp

### Tasks Not Syncing
- Verify user is authenticated
- Check Firestore Security Rules
- Ensure internet connection is active

### Build Errors
- Run `flutter clean` then `flutter pub get`
- Update Flutter: `flutter upgrade`
- Check minimum SDK versions (Android 21+, iOS 11+)

---

## 👨‍💻 Author

**Ahmed Yousef**

- GitHub: [@AhmedYousef72](https://github.com/AhmedYousef72)
- LinkedIn: [Your LinkedIn Profile](https://www.linkedin.com/in/ahmed-youssef-2b0239227/)
- Email: ahmed.yf.el.sayed@gmail.com

---

## 🙏 Acknowledgments

- [Flutter Team](https://flutter.dev) - Cross-platform framework
- [Firebase](https://firebase.google.com) - Backend services
- [Provider](https://pub.dev/packages/provider) - State management
- [EasyLocalization](https://pub.dev/packages/easy_localization) - Internationalization
- [Material Design](https://material.io/design) - Design guidelines

---
## 📚 Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Firebase Documentation](https://firebase.google.com/docs)
- [Provider Package](https://pub.dev/packages/provider)
- [Material Design](https://material.io/design)

---

**⭐ If you find this project helpful, please give it a star!**

**Happy Coding! 🚀**
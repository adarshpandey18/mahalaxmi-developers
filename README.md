
# Mahalaxmi Developers

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)
![Web](https://img.shields.io/badge/Web-Platform-9cf)

Mahalaxmi Developers is a web application built using **Flutter Web** and powered by **Firebase**. It is designed to showcase property listings, manage user interactions, and provide a seamless experience for real estate developers and clients.

---

## Features

- **Responsive Web Design**: Built with Flutter Web for a seamless experience across devices.
- **Firebase Integration**:
  - **Authentication**: User login and sign-up.
  - **Firestore Database**: Real-time property listings and user data management.
  - **Storage**: Upload and manage property images.
- **Property Listings**: View, add, and manage property details.
- **User-Admin Chat**: User can chat with agents .
- **Admin Panel**: Manage properties, chat with users.

---

## Getting Started

### Prerequisites

- **Flutter SDK**: Ensure you have Flutter installed. If not, follow the [official Flutter installation guide](https://flutter.dev/docs/get-started/install).
- **Firebase Project**: Set up a Firebase project and enable Firestore, Authentication, and Storage.
- **Web Browser**: The app is designed for web platforms, so ensure you have a modern browser like Chrome or Firefox.

### Installation

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/adarshpandey18/mahalaxmi-developers.git
   cd mahalaxmi-developers
   ```

2. **Install Dependencies**:
   ```bash
   flutter pub get
   ```

3. **Configure Firebase**:
   - Add your Firebase configuration in `lib/firebase_options.dart`.
   - Ensure Firebase is initialized in your app (check `main.dart`).

4. **Run the App**:
   ```bash
   flutter run -d chrome
   ```

---

## Firebase Setup

1. Create a Firebase project at [Firebase Console](https://console.firebase.google.com/).
2. Enable **Firestore**, **Authentication**, and **Storage** in your Firebase project.
3. Add a web app to your Firebase project and copy the configuration.
4. Replace the Firebase configuration in `lib/firebase_options.dart` with your own.

---

## Folder Structure

```
mahalaxmi-developers/
├── lib/
│   ├── models/          # Data models
│   ├── screens/         # UI screens
│   ├── services/        # Firebase services 
│   ├── widgets/         # Reusable UI components
│   ├── main.dart        # Entry point
│   └── firebase_options.dart # Firebase configuration
├── assets/              # Static assets (images, fonts, etc.)
├── pubspec.yaml         # Dependencies and project configuration
└── README.md            # Project documentation
```

---

## Contributing

Contributions are welcome! If you'd like to contribute, please follow these steps:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/YourFeatureName`).
3. Commit your changes (`git commit -m 'Add some feature'`).
4. Push to the branch (`git push origin feature/YourFeatureName`).
5. Open a pull request.

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## Acknowledgments

- [Flutter](https://flutter.dev/) for the amazing UI framework.
- [Firebase](https://firebase.google.com/) for backend support.
- The Flutter and Firebase communities for their endless resources and support.

---

## Contact

For any queries or feedback, feel free to reach out:

- **Adarsh Pandey**  
  GitHub: [adarshpandey18](https://github.com/adarshpandey18)  
  Email: [your-email@example.com](mailto:itsadarshvijaypandey@gmail.com)
---

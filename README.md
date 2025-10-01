# 📱 BaseProyect (SwiftUI App)

BaseProyect is a **SwiftUI iOS application** built with a **clean architecture approach** (Data, Domain, Presentation).  
It includes authentication (login, token storage, token refresh) and a basic navigation with splash, login, home screen, and side menu.

---

## 🚀 Features

- ✅ **MVVM + Clean Architecture** (Domain, Data, Presentation layers)  
- ✅ **User Authentication** with login, token storage, and refresh  
- ✅ **Custom SwiftUI Components** (buttons, text fields, dialogs)  
- ✅ **Side Menu navigation** with profile section  
- ✅ **Splash screen** with simple animation  
- ✅ **Error handling** via custom dialogs  

---

## 🏗 Project Structure

```
BaseProyect/
│
├── Constants/               # Global constants
│
├── data/                    # Data layer (repositories, networking, storage, DTOs)
│   ├── model/               # DTOs and API response models
│   ├── network/             # Networking logic
│   ├── repositories/        # Repository implementations
│   └── storage/             # Token persistence (UserDefaults)
│
├── domain/                  # Domain layer (business rules)
│   ├── model/               # Domain entities
│   ├── repositories/        # Abstract repositories
│   └── useCases/            # Application use cases (e.g. Login)
│
├── presentation/            # UI layer (SwiftUI views)
│   ├── components/          # Reusable UI elements
│   ├── Login/               # Login screen + ViewModel
│   ├── Home/                # Home screen
│   ├── ManageScreen/        # Side menu & navigation
│   ├── Splash/              # Splash screen
│   ├── BaseProyectApp.swift # App entry point
│   └── ContentView.swift    # Root view for navigation
│
└── ...
```

---

## ⚙️ Requirements

- iOS **16.0+**  
- Xcode **15+**  
- Swift **5.9+**

---

## ▶️ Installation & Run

1. Clone the repo:

```bash
git clone https://github.com/your-username/BaseProyect.git
cd BaseProyect
```

2. Open in **Xcode**:

```bash
open BaseProyect.xcodeproj
```

3. Select a simulator or device and **Run ▶️**

---

## 🔑 Authentication Flow

- User logs in with **email** and **password**.  
- Token is stored in `UserDefaults` (via `TokenStorage`).  
- If a request fails with **401 Unauthorized**, token refresh is automatically triggered.  
- Users can log out via **Side Menu**.  

---

## 📂 Main Screens

- **SplashScreen** → Animated logo on launch  
- **LoginScreen** → Email & password form + error handling  
- **HomeScreen** → Main app view with toolbar & logout option  
- **SideMenu** → Profile section + navigation tabs  

---

## 🛠 Future Improvements

- 🔒 Store tokens securely in **Keychain** instead of UserDefaults  
- 🧪 Add **Unit Tests** for repositories and use cases  
- 🎨 Improve UI/UX for production release  
- 📱 Expand navigation tabs (Profile, Favorites, etc.)  

---

## 👨‍💻 Author

Developed by **Najib Alejandro Loera**  

---

## 🏷 Badges

```
![Swift](https://img.shields.io/badge/Swift-5.9-orange?logo=swift)
![iOS](https://img.shields.io/badge/iOS-16%2B-blue?logo=apple)
![Xcode](https://img.shields.io/badge/Xcode-15%2B-lightblue?logo=xcode)
```

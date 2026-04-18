# GigWeatherWage Mobile

A Flutter-based mobile companion app for [GigWeatherWage](https://gigweatherwage.vercel.app) — helping gig workers make smarter decisions based on weather and wage data.

## 🌐 Live Web App (PWA)

👉 **[Open Web App](https://adithi-k-max.github.io/gigweatherwage_mobile/)**

> Works on any browser. On mobile, you can install it as a PWA:
> - **Android**: Chrome → 3-dot menu → "Add to Home Screen"
> - **iPhone**: Safari → Share → "Add to Home Screen"

## 📲 Download Android App (APK)

👉 **[Download APK](https://github.com/adithi-k-max/gigweatherwage_mobile/releases/latest)**

> After downloading, enable "Install from unknown sources" on your Android phone and open the APK to install.

## 📱 Features

- Mobile-optimized interface for GigWeatherWage
- Loads the full GigWeatherWage web app in a native wrapper
- Installable as a PWA on Android & iOS
- Available as a direct APK for Android

## 🚀 Running Locally

```bash
flutter pub get
flutter run
```

## 🏗️ Build

```bash
# Web
flutter build web --base-href "/gigweatherwage_mobile/"

# Android APK
flutter build apk --release
```

## 🔗 Related

- Main Website: [gigweatherwage.vercel.app](https://gigweatherwage.vercel.app)
- Main Repo: [GigWeatherWage](https://github.com/adithi-k-max/gigweatherwage)

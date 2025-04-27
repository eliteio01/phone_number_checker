
# 📱 phone_number_checker

[![pub package](https://img.shields.io/pub/v/phone_number_checker.svg)](https://pub.dev/packages/phone_number_checker)
[![License: BSD-3-Clause](https://img.shields.io/badge/license-BSD--3--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)
[![Build Status](https://github.com/eliteio01/phone_number_checker/actions/workflows/flutter.yml/badge.svg)](https://github.com/eliteio01/phone_number_checker/actions)


A lightweight Flutter package to detect Nigerian mobile networks (MTN, Airtel, Glo, 9mobile) from phone numbers in local (`080xxxxxxx`) or international (`+23480xxxxxxx`) formats.

---

## ✨ Features

- Detects Nigerian mobile network operators:
    - **MTN**
    - **Airtel**
    - **Glo**
    - **9mobile**
- Accepts numbers in local (`080...`) and international (`+23480...`) formats.
- Returns **Unknown** for unsupported or invalid numbers.
- Simple API and easy to integrate.

---

## 🚀 Getting Started

Add `phone_number_checker` to your `pubspec.yaml`:

```yaml
dependencies:
  phone_number_checker: ^0.0.1
```

Then run:

```bash
flutter pub get
```

---

## 📦 Usage

Import the package:

```dart
import 'package:phone_number_checker/phone_number_checker.dart';
```

Check the network:

```dart
final network = NetworkChecker.getNetwork('08031234567');
print(network.name); // Output: MTN
```

Or with international format:

```dart
final network = NetworkChecker.getNetwork('+2348031234567');
print(network.name); // Output: MTN
```

You can use the returned value like this:

```dart
switch (network) {
  case Network.mtn:
    // Handle MTN logic
    break;
  case Network.airtel:
    // Handle Airtel logic
    break;
  case Network.glo:
    // Handle Glo logic
    break;
  case Network.nineMobile:
    // Handle 9mobile logic
    break;
  case Network.unknown:
    // Handle unknown number
    break;
}
```

---

## 🗓 Example App

Check out the `example/` folder for a full working demo of how to use `phone_number_checker`.

You can run it with:

```bash
cd example
flutter run
```

---

## 🔧 Supported Networks

- **MTN Nigeria**
- **Airtel Nigeria**
- **Glo Nigeria**
- **9mobile Nigeria**

Unknown or invalid numbers are returned as `Network.unknown`.



## 🚀 Contributions

Pull requests are welcome! For major changes, please open an issue first
to discuss what you would like to change.

---

Made with ❤️ by **Laiki Tech Innovations**

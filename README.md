# 📱 Flutter MVVM Architecture with GetX

A Flutter application structured using the MVVM (Model-View-ViewModel) architecture pattern, leveraging GetX for state management, dependency injection, and routing. This architecture ensures a clean separation of concerns, scalability, and maintainability.

## 📸 Project Preview

![MVVM Architecture Diagram](assets/images/app_thumnail.png)

## 📂 Project Structure

    lib/
    ├── app/
    │   ├── bindings/
    │   │   └── app_bindings.dart
    │   ├── constants/
    │   │   ├── app_constants.dart
    │   │   ├── color_manager.dart
    │   │   └── strings_manager.dart
    │   ├── networking/
    │   │   ├── api_result.dart
    │   │   ├── api_result.freezed.dart
    │   │   ├── dio_factory.dart
    │   │   ├── error_model.dart
    │   │   └── network_exceptions.dart
    │   ├── routes/
    │   │   └── app_routes.dart
    │   └── services/
    │       ├── repo.dart
    │       ├── web_services.dart
    │       └── web_services.g.dart
    ├── models/
    │   └── item_model.dart
    ├── view_models/
    │   └── item_controller.dart
    ├── views/
    │   ├── item_list_view.dart
    │   ├── item_detail_view.dart
    │   └── widgets/
    │       └── item_builder.dart
    └── main.dart

## 🚀 Features

- **MVVM Architecture**: Clear separation of concerns with ViewModel handling business logic and Views displaying the UI.
- **Dynamic UI**: State managed reactively with **GetX** for efficient updates.
- **Reactive API Calls**: **Retrofit** and **Dio** enable smooth, reactive API integration.
- **Error Handling**: Custom error models and exceptions to handle network errors effectively.
- **Routing**: Manage navigation through **GetX**'s robust routing system.

## 🔧 Dependencies

- **GetX**: State management and routing.
- **Retrofit**: Network API calls with automatic response mapping.
- **Dio**: HTTP client for network requests.
- **Freezed**: Code generation for immutable data classes.
- **Build Runner**: Tool for code generation.


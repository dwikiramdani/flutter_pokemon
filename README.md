# flutter_pokemon

Poke Dex Flutter Application

### Get Started
##### [online documentation](https://flutter.dev/docs)
##### [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
##### [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

# my_pokemon
https://www.figma.com/file/OEgbYara8wfy75H74osdZs/Pok%C3%A9dex-(Community)?node-id=314%3A3&t=vA6IQCLny4JaeFSh-0

API
https://pokeapi.co/docs/v2

### Flutter Version
**3.16.8**

### Dart Version
**3.2.5**

### Check flutter health condition
```
flutter doctor -v
```

### Generate project launcher icon
```
- flutter clean
- flutter pub get
- flutter pub run flutter_launcher_icons:main -f flutter_launcher_icons*
*Please provide flutter_launcher_icons setting for each project build flavor
```

## How to Build
### Command to build
```
flutter build apk --split-per-abi --flavor={targetFlavor} --target={targetEnv}
```

#### Build Arguments
```
targetFlavor = dev | prod |                   // Define flavor
targetEnv = lib/main_dev.dart | lib/main.dart // Define target environment
```

### Example - Build an APK
```
flutter build apk --flavor=dev --target=lib/main_dev.dart
flutter build apk --flavor=prod --target=lib/main.dart
```

### Example - Build an app bundle
```
flutter build appbundle --flavor=dev --target=lib/main_dev.dart
flutter build appbundle --flavor=prod --target=lib/main.dart
```

### Example - Build an API
```
flutter build api --flavor=dev --target=lib/main_dev.dart
flutter build api --flavor=prod --target=lib/main.dart
```


# Flutter BLoC Clean Code Folder Structure

Organizing Flutter project using the BLoC pattern and clean code principles in order to improve maintainability and scalability:

```plaintext
lib/
|-- core/
|   |-- error/
|   |   |-- failure.dart
|   |   |-- exceptions.dart
|   |
|   |-- network/
|   |   |-- api_client.dart
|   |   |-- endpoints.dart
|   |
|   |-- repository/
|   |   |-- repository.dart
|   |
|   |-- usecases/
|       |-- usecase.dart
|
|-- features/
|   |-- feature1/
|   |   |-- presentation/
|   |   |   |-- bloc/
|   |   |   |   |-- feature1_bloc.dart
|   |   |   |
|   |   |   |-- pages/
|   |   |   |   |-- feature1_page.dart
|   |   |   |
|   |   |   |-- widgets/
|   |   |       |-- feature1_widget.dart
|   |   |
|   |   |-- domain/
|   |   |   |-- entities/
|   |   |   |   |-- feature1_entity.dart
|   |   |   |
|   |   |   |-- repositories/
|   |   |   |   |-- feature1_repository.dart
|   |   |   |
|   |   |   |-- usecases/
|   |   |       |-- feature1_usecase.dart
|   |   |
|   |   |-- data/
|   |       |-- datasources/
|   |       |   |-- feature1_remote_data_source.dart
|   |       |
|   |       |-- models/
|   |           |-- feature1_model.dart
|   |
|   |-- feature2/
|       |-- ...
|
|-- shared/
|   |-- widgets/
|   |   |-- shared_widget1.dart
|   |   |-- shared_widget2.dart
|   |
|   |-- utils/
|       |-- app_constants.dart
|       |-- app_helpers.dart
|
|-- main.dart
```

## BLoC Clean Code Folder Structure

### `lib/` Directory

The `lib/` directory is the main directory for your Flutter project code.

#### `core/` Directory

The `core/` directory contains the core logic of your application, following clean architecture principles.

- `error/`: Holds classes related to handling errors and failures.
- `network/`: Contains the API client and endpoint definitions.
- `repository/`: Defines the repositories used in the application.
- `usecases/`: Contains the use cases that interact with the repositories.

#### `features/` Directory

The `features/` directory holds all the features of your application, each in its own subdirectory.

- `feature1/`: Represents a specific feature of the application.
    - `presentation/`: Contains the BLoC, UI pages, and widgets related to the feature.
        - `bloc/`: Holds the BLoC class for the feature.
        - `pages/`: Contains the UI pages for the feature.
        - `widgets/`: Contains reusable widgets specific to the feature.
    - `domain/`: Contains the domain logic for the feature.
        - `entities/`: Defines the entities used in the feature.
        - `repositories/`: Defines the repositories specific to the feature.
        - `usecases/`: Contains the use cases specific to the feature.
    - `data/`: Holds the data layer for the feature.
        - `datasources/`: Defines remote or local data sources.
        - `models/`: Contains data models used in the feature.

#### `shared/` Directory

The `shared/` directory contains shared components and utilities that can be used across different features.

- `widgets/`: Contains reusable widgets that are shared across features.
- `utils/`: Holds utility classes/constants used throughout the application.

### `main.dart` File

The `main.dart` file serves as the entry point of your Flutter application.

### `app.dart` File

The `app.dart` responsible for setting up the providers, initializing the BLoC layer, and configuring the main application structure.
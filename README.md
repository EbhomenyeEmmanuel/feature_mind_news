# Feature Mind News

A clean and modern news app built using **Clean Architecture** and **Riverpod** for state management. This app fetches news articles from an API, supports pagination, includes animations and caching for a seamless user experience.

## Getting Started 
To get started with the project, follow these steps:
1. **Clone the repository:**
   ```bash
   git clone https://github.com/your-username/feature_mind_news.git
   cd feature_mind_news
2. **Install dependencies:**
   ```bash
   flutter pub get
3. **Set up environment variables:** 
- Create a .env file called keys in the root directory.
- Add your API key for [The News API](https://newsapi.org/)
   ```env
   apiKey=your_api_key_here
4. **Run the app:**
   ```bash
   flutter run

## API
- This app uses [The News API](https://newsapi.org/docs/endpoints/everything) to fetch news articles. The API provides comprehensive news data, including headlines, descriptions, and images.

## Packages used
* [Google Fonts](https://pub.dev/packages/google_fonts): Easily apply custom fonts to the app.
* [Cached Network Image](https://pub.dev/packages/cached_network_image): Efficiently load and cache images from the web.
* [Dotenv](https://pub.dev/packages/flutter_dotenv): Securely manage environment variables
* [Http](https://pub.dev/packages/http): Make HTTP requests to fetch news data.
* [RiverPod](https://pub.dev/packages/flutter_riverpod): State management for a clean and scalable app architecture.
* [Freezed](https://pub.dev/packages/freezed_annotation): Simplify data class creation with code generation.
* [Flutter SVG](https://pub.dev/packages/flutter_svg): Render SVG images in the app.
* [Get It](https://pub.dev/packages/get_it): Dependency injection for better code organization.
* [Hive](https://pub.dev/packages/hive_flutter): Lightweight and fast local database for caching
* [Smart SnackBar](https://pub.dev/packages/smart_snackbars): Display easily customizable snackabars.
* [Launcher Icons](https://pub.dev/packages/flutter_launcher_icons): Generate app launcher icons easily

## Features
* Pagination
* Animations Between screens
* Caching 

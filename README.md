# Google News

A Flutter-based news application that allows users to browse news articles, explore content, and share news through a mobile-friendly interface.

## Features

- Browse news articles
- Load article images efficiently
- Open article links in a browser
- Share news articles
- Display relative publication times
- Manage application navigation

## Tech Stack

- **Flutter**: Cross-platform application development
- **Dart**: Programming language
- **GetX**: State management and navigation
- **HTTP**: API requests
- **Cached Network Image**: Image loading and caching
- **URL Launcher**: Open external links
- **Share Plus**: Share news articles
- **Timeago**: Relative time formatting
- **Intl**: Date and time formatting
- **Flutter Dotenv**: Environment variable configuration

## Getting Started

### Prerequisites

- Flutter SDK
- Dart SDK
- Android Studio or Visual Studio Code

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/najlanafisah/Google-News.git
   cd Google-News
   ```

2. Install dependencies:

   ```bash
   flutter pub get
   ```

3. Configure the required environment variables in the `.env` file.

4. Run the application:

   ```bash
   flutter run
   ```

## Project Structure

```text
Google-News/
├── android/              # Android configuration
├── assets/               # Application assets
├── ios/                  # iOS configuration
├── lib/                  # Main application source code
├── linux/                # Linux configuration
├── macos/                # macOS configuration
├── test/                 # Application tests
├── web/                  # Web configuration
├── windows/              # Windows configuration
├── .env                  # Environment configuration
├── analysis_options.yaml # Dart analysis settings
├── pubspec.yaml          # Dependencies and project settings
├── pubspec.lock          # Locked dependency versions
└── README.md             # Project documentation
```

## Project Status

A Flutter project focused on browsing and sharing news content.

## License

No license has been specified for this repository.

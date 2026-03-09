# Assignment 1: Displaying Images in Flutter

## Objective
This project is a Flutter application that demonstrates how to effectively display images from both local assets and remote network sources. It includes custom UI styling and robust error-handling mechanisms.

## Features Implemented
* **Local Asset Image:** * Displays an image from the local `assets` directory.
  * Customized with a smooth `borderRadius` (rounded corners) and a visually appealing drop shadow effect using `BoxDecoration`.
* **Network Image:** * Fetches and displays an image from a remote URL.
  * Implements `loadingBuilder` to show a `CircularProgressIndicator` while the image is downloading.
  * Implements `errorBuilder` to display an error icon and text if the image fails to load.

## Getting Started

### Prerequisites
* Flutter SDK installed on your system.
* An IDE such as VS Code or Android Studio.

### Installation & Setup
1. Clone this repository:
   ```bash
   git clone <your-repository-link>

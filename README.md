# News Reader(version 1.0) App - SwiftUI with MV Pattern Approach
## Overview

This project is a simple news reader application built using SwiftUI and follows the Model-View (MV) Pattern. The app consists of two main screens:

- Headlines View: Displays a list of news article headlines.
- Stories View: Shows the full story when a headline is tapped.
- The app fetches data from a mock API layer provided in the project, which includes implementations for async/await. This project uses the async/await approach for API requests.

## Features

### Headlines View:
Displays a scrollable list of headlines.
Each headline shows the title and author's name.
Handles loading and error states.
Fetches data from the API when the view appears.
### Stories View:
Displays the full story, including the title, author, content, and published date.
Handles loading and error states.
Fetches data from the API when a headline is tapped.
In-Memory Cache:
Stores the last fetched headlines and stories.
Displays cached data when the API call fails.

## Advantages of the MV Pattern Approach
### Separation of Concerns:
The Model handles data fetching and business logic.
The View is responsible for UI rendering and user interaction.
This separation makes the codebase more modular and easier to maintain.

### Scalability:
The pattern makes it easier to add new features or modify existing ones without affecting other parts of the app.
The clear structure helps in onboarding new developers to the project.

### Reusability:
Components like the loading and error states can be reused across different views.
The in-memory cache logic can be extended or reused in other parts of the app.
Improved Readability:
The code is organized in a way that is easy to follow and understand.
The use of SwiftUI's declarative syntax further enhances readability.
Project Structure

## Network layer:
Contains the mock API layer with methods getHeadlines and getStory.
Includes implementations for async/await.


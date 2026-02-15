# Expense Tracker App

## Overview

The Expense Tracker App is a Flutter application designed to help users manage their expenses efficiently. It allows users to add, view, and categorize their expenses, providing insights into their spending habits.

## Architecture

The app is built using the following components:

1. **Models**: Define the data structures for expenses and expense categories.
2. **Screens**: Provide the user interface for adding, viewing, and managing expenses.
3. **Charts**: Display visual representations of expense data to help users analyze their spending patterns.
4. **Main Application**: Orchestrates the flow between different screens and models.

## Data Flow

### User Interaction

1. **Adding an Expense**:
   - The user navigates to the "New Expense" screen.
   - They input details such as amount, category, and date.
   - The expense is saved using the `ExpenseRepository`.

2. **Viewing Expenses**:
   - The user navigates to the "Home Screen".
   - The app retrieves all expenses from the `ExpenseRepository`.
   - The expenses are displayed in a list format.

3. **Categorizing Expenses**:
   - Each expense is categorized using an enumeration (`Category`).
   - The category information is stored along with the expense details.

### Data Storage

- The app uses a simple in-memory data structure to store expenses.
- This can be extended to use a persistent storage solution like SQLite or Firebase for more complex applications.

## Screens and Components

1. **Home Screen**:
   - Displays a list of all expenses.
   - Provides options to add new expenses and view expense categories.

2. **New Expense Screen**:
   - Allows users to input details about an expense.
   - Validates the input and saves the expense using the `ExpenseRepository`.

3. **Charts Screen**:
   - Displays visual representations of expense data.
   - Uses a charting library to create bar charts, pie charts, etc.

## Dependencies

- Flutter: The primary framework for building the app.
- Provider: A state management solution for managing app state.
- Charts_flutter: A library for creating various types of charts.

## Getting Started

1. Clone this repository:
   ```sh
   git clone https://github.com/your-repo/expense-tracker.git
   ```

2. Navigate to the project directory:
   ```sh
   cd expense-tracker
   ```

3. Install dependencies:
   ```sh
   flutter pub get
   ```

4. Run the app:
   ```sh
   flutter run
   ```

## Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/AmazingFeature`).
3. Make your changes and commit them (`git commit -m 'Add some AmazingFeature'`).
4. Push to the branch (`git push origin feature/AmazingFeature`).
5. Open a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

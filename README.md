# Mojo Pizza App

Mojo Pizza App MVP is a mobile application, an attempt to clone of Mojo Pizza App, built with Flutter, featuring Firebase Authentication and Firestore integration. The app offers a seamless pizza ordering experience with user authentication, menu browsing, cart management, and payment options.

## Features

### Authentication
- **Splash Screen**: Displays a linear loading progress indicator before navigating to the sign-up screen.
- **Sign-Up Options**: Users can sign up using their phone number (using `verifyPhoneNumber` from Firebase Auth) or Google Sign-In. Existing users are not duplicated in Firestore.
- **OTP Verification**: Users receive an OTP via Firebase Auth for phone number authentication.

### Home Screen
- **Bottom Navigation Bar**: Includes five tabs—Home, Offers, EatClub, Refer, and Account.
  - **Home Tab**: Displays the user's current address (fetched using the Geolocator package) and clickable cards leading to the menu screen.
  - **Account Tab**: Shows the user's name and email address fetched from Firestore.
  - **Offers, EatClub, and Refer Tabs**: Contain basic static data.

### Menu Screen
- **Search Bar**: Present but not yet functional.
- **Veg Filter**: Present but not yet functional.
- **Food Categories**: Scrollable list of tabs for different food categories. Clicking a tab renders a list of pizza cards with details fetched from Firestore.
- **Add to Cart**: Each pizza card has an "Add" button to add items to the cart. If an item is already in the cart, the button changes accordingly.

### Cart Screen
- **Pizza List**: Displays all pizzas added to the cart with buttons to increase or decrease quantity.
- **Place Order Button**: Redirects to the payment methods screen.
  - **Payment Methods**: 
    - **UPI**: Works only on Android devices using the `pay_india` package.
    - **Razorpay**: Integration with Razorpay payment gateway (test mode/demo version).

### State Management
- **BLoC**: All state management is handled using the BLoC pattern.
- **Enterprise Architecture**: Code structured according to enterprise architecture standards.

## Scope of Improvement

- **Geolocation for Dynamic Address Fetching**: Enhance geolocation implementation to fetch dynamic user locations.
- **Search Functionality**: Implement the search bar functionality on the menu screen.
- **Veg Filter**: Develop and integrate the veg filter feature.
- **Payment Integration**: Move from test mode to live mode for Razorpay integration and expand UPI functionality to iOS.
- **User Experience**: Improve UI/UX across the app for a more intuitive user experience.

## Installation

To run Mojo Pizza App locally, follow these steps:

1. Clone the repository: `git clone https://github.com/Pulkito4/Mojo_Pizza_App_MVP.git`
2. Navigate to the project directory: `cd Mojo_Pizza_App_MVP`
3. Install dependencies: `flutter pub get`
4. Run the app: `flutter run`

## Contributions

Contributions are welcome! If you find any issues or have suggestions for improvements, feel free to open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).

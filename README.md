# Peepl Dapp


A frontend for users to interact with our vesting smart contract

## How to run locally
To run locally, make sure you have Flutter installed and simply run `flutter run`. This will launch the debug version of Chrome.

## How to build for deployment
In order to build for deployment (which basically runs dart2js and creates the HTML and CanvasKit layouts), simply run `flutter build web`. You can then serve this files from a static web server (as Flutter currently doesn't support SSR).
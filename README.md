# Peepl Vesting Dapp

Flutter Web dapp providing a user-facing frontend to the [Peepl](https://github.com/itsaboutpeepl) token vesting smart contract, deployed on the Fuse network.

## Overview

Peepl was a Liverpool based community currency and commerce ecosystem running on the [Fuse network](https://www.fuse.io), an EVM-compatible chain optimised for low-fee consumer payments. This repository contains the Flutter Web frontend I built for token vesting holders, allowing them to:

- Connect their browser wallet (MetaMask or WalletConnect)
- View their vesting schedule and unlock progress
- Claim vested tokens once they unlock
- Inspect cliff and linear-release parameters from the contract

This was professional smart contract dev work during my 2020 to 2022 period, before transitioning into mobile-first Flutter engineering.

## Tech stack

- **Flutter Web** (Dart SDK `>=2.16.1 <3.0.0`)
- **`flutter_web3 ^2.1.9`** for browser wallet integration (MetaMask, WalletConnect)
- **`get ^4.6.1`** (GetX) for state management, dependency injection, and routing
- **`fl_chart ^0.45.0`** for vesting schedule visualisation
- **`decimal ^1.1.0`** for safe token-amount arithmetic (avoiding float precision issues common in dapp code)
- **`intl`** for date and number formatting
- **`shared_preferences`** for local persistence
- **Network:** Fuse (EVM-compatible)

## Why these choices

A few non-obvious decisions worth flagging for anyone reading the code:

- **`flutter_web3` over `web3dart`.** This is a browser dapp, not a server-signing tool. Users connect their own wallet; the app never holds private keys. `flutter_web3` wraps the browser's injected provider (window.ethereum), which is the correct pattern for a public dapp. `web3dart` would have been wrong here because it expects a private key in memory.
- **`decimal` for token math.** Vesting calculations involve token amounts measured in 18-decimal "wei". Using Dart's `double` would introduce rounding errors at scale. `decimal` keeps arithmetic exact.
- **GetX for everything.** State, routing, and DI in one package. Opinionated, but kept the dapp lean for a small team.

## How to run locally

```bash
flutter pub get
flutter run -d chrome
```

This launches the debug build in Chrome. You'll need a browser wallet extension (MetaMask) configured for the Fuse network.

## How to build for deployment

```bash
flutter build web
```

Produces a static bundle under `build/web`. Deploy to any static host (Netlify, Vercel, GitHub Pages, S3).

Flutter Web doesn't currently support SSR, so this is a fully client-side dapp by design.

## Status and what would change today

This dapp is from 2022. It still works, but a current rewrite would differ in several ways:

- **`flutter_web3` is no longer the standard.** WalletConnect's [Web3Modal for Flutter](https://github.com/WalletConnect/Web3ModalFlutter) is now the recommended path, supporting mobile + desktop wallet connection in one package.
- **GetX has lost favour.** Riverpod, Bloc, or Provider are the current consensus for state management; routing would move to `go_router`.
- **Tests.** Coverage was light. A current rewrite would have unit tests for the vesting calculation logic and widget tests for the claim flow.
- **Internal package name.** `pubspec.yaml` still shows `name: nftapp` from when the project was scaffolded from another template. Cosmetic but worth fixing.

## License

(set as appropriate)

## Acknowledgements

Built for the [Peepl](https://github.com/itsaboutpeepl) ecosystem, on the [Fuse network](https://www.fuse.io).

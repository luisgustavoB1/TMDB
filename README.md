# The Movie Database - iOS
The Movie Database is my implementation for an iOS app to show movies.

## Description
The Movie Database is an iOS app to fetch and present popular movies and their details from TMDB website.

## Getting started
To run the project, you simply open the project and wait for packages to be downloaded
#### The app requires an API key from TMDB website to run it, please add you API key in the AppConstants file to the "Authorization" variable shown in the following screenshot:
<img width="1044" alt="Screenshot 2024-03-10 at 7 49 17 PM" src="https://github.com/luisgustavoB1/DSPokemon/assets/46496566/85367dd4-1f6f-4772-a7c8-85993643e713">


## Screens overview
<img width="300" alt="Home Popular" src="https://github.com/luisgustavoB1/DSPokemon/assets/46496566/416bbfb2-c4b9-4b84-bc6e-0495b290d101"> | <img width="300" alt="Detail" src="https://github.com/luisgustavoB1/DSPokemon/assets/46496566/688e9637-0d2d-4039-89dc-0ff3ec77c642">

## Tech stack
- Swift and SwiftUI for the design.
- SPM for handling packages.
- Used MVVM UI Design Pattern

## Main Features
- List popular films so the user can browse them.
- Pagination for loading movies.
- Customised SwiftUI views for common use.
- Detail cell to show the main image
- Detail view for the user to show the details of the desired film.
- MVVM architecture with clean architecture principles and single responsibility everywhere!
- Error handling

### Bonus features:
- Implementation of in-memory caching for images to improve the user experience.
- Simulation testing for the network 
- Unit testing for the main network layers using Mocks.
- Snapshot test to validate some layouts

## Packages
- SnapshotTesting: Used for Snapshot testing.

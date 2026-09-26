# Contacts List

Flutter contacts app backed by a REST API on [Back4App](https://www.back4app.com/). Each contact can have a photo taken with the camera or picked from the gallery.

## Features

- List, add, edit and view contacts
- Take a photo with the camera or pick one from the gallery
- Photos taken with the camera are also saved to the device gallery
- Data synced with Back4App through its REST API

## Stack

Flutter · Dart · Dio · Back4App (Parse REST API) · image_picker · gallery_saver · flutter_dotenv

## Running

1. Create an app on Back4App with a contacts class
2. Create `lib/constants/.env`:

   ```
   APP_ID=
   APP_KEY=
   PARSE_ADDRESS=
   ```

3. Run:

   ```bash
   flutter pub get
   flutter run
   ```

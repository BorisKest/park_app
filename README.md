# park_app

Grena Park app 

    This app was developed for the park and serves as a map and guide in the park. It helps visitors navigate around the park and provides information about plants, trees, and animals. The paper map has been replaced by an interactive map with active geolocation, instead of large signs with lots of text there is now a small QR code that does not disturb the natural beauty, in the application the user can scan the code and view information about the plant or object of interest.

This application used the following: povider - With the help of a provider was implemented functionality to change the theme of the application and the language.
SQLite - To work with data more conveniently, SQLite was implemented. This will help to append/change/delete data in a more convenient format in the future.
location - For navigation, the third party library flutter_map was used. With it, the application displays the data from the OpenStreetMap server.
localization - At the moment the application was translated into 6 languages. This is necessary for a better user experience, since park visitors often come from other countries.

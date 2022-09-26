# infinit_list_bloc

Implementing an app which fetches data over the network and loads
it as a user scrolls using Flutter and the bloc library.

## Project Structure
```
├── lib
|   ├── posts_feature
│   │   ├── bloc
│   │   │   └── post_bloc.dart
|   |   |   └── post_event.dart
|   |   |   └── post_state.dart
|   |   └── models
|   |   |   └── models.dart*
|   |   |   └── post.dart
│   │   └── view
│   │   |   ├── posts_page.dart
│   │   |   └── posts_list.dart
|   |   |   └── view.dart*
|   |   └── widgets
|   |   |   └── bottom_loader.dart
|   |   |   └── post_list_item.dart
|   |   |   └── widgets.dart*
│   │   ├── posts.dart*
│   ├── app.dart
│   ├── simple_bloc_observer.dart
│   └── main.dart
├── pubspec.lock
├── pubspec.yaml
```



The application uses a feature-driven directory structure. This 
project structure enables us to scale the project by having 
self-contained features.


# Docs
Docs are in doc folder
# Viewing docs
An easy way to run an HTTP server locally is to use the dhttpd package. For example:

$ dart pub global activate dhttpd
$ dhttpd --path doc/api
Navigate to http://localhost:8080 in your browser; the search function should now work.

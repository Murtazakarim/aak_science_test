import 'package:aakscience_test/api_service/api_end_point_paths.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Represents the current environment for the application.
const Environment workingEnv = Environment.production;

/// An enumeration that defines the different environments the application can run in.
enum Environment { development, production }

/// Extension methods for the [Environment] enum to provide additional functionality.
extension EnvironmentExtension on Environment {
  /// Returns the host URL based on the current environment.
  String get host {
    switch (this) {
      case Environment.development:
        return ''; // Localhost for development
      case Environment.production:
        return '${dotenv.env['PRODUCTION_URL']}'; // Production server address
    } // Production server address
  }
}

/// An enumeration that defines various API endpoints used in the application.
enum ApiEndpoint {
  signUp,
}

/// Extension methods for the [ApiEndpoint] enum to provide additional functionality.
extension ApiEndpointExtension on ApiEndpoint {
  /// Returns the complete URL for the specific API endpoint.
  String get url {
    switch (this) {
      case ApiEndpoint.signUp:
        return _finalUrl(ApiPaths.signup);
    }
  }

  /// Constructs the final URL by appending the path to the host URL of the current environment.
  String _finalUrl(String path) {
    if (kDebugMode) {
      print('${workingEnv.host}$path');
    }
    return '${workingEnv.host}$path'; // Combines host and path to create the final URL
  }

  // Add path parameters dynamically
  String withPathParameters(
      Map<String, String> pathParams, ApiEndpoint endpoint) {
    String url = endpoint.url;
    pathParams.forEach((key, value) {
      url = url.replaceFirst('{$key}', value);
    });
    if (kDebugMode) {
      print(url);
    }
    return url;
  }
}

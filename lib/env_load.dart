class EnvironmentVariables {
  final String strapiKey;
  final String strapiUrl;

  EnvironmentVariables({required this.strapiKey, required this.strapiUrl});

  factory EnvironmentVariables.init() {
    const String strapiKey = String.fromEnvironment("STRAPI_KEY");
    const String strapiUrl = String.fromEnvironment("STRAPI_URL");
    return EnvironmentVariables(strapiKey: strapiKey, strapiUrl: strapiUrl);
  }
}

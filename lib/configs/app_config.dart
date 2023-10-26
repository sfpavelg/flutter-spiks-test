class AppConfig {
  static String baseUrl = '';

  static const String defaultLocale = 'ru';

  static const defaultStartAgeFilter = 18;
  static const defaultEndAgeFilter = 80;
  static const defaultMinCostOfServices = 0;
  static const defaultMaxCostOfServices = 100000;

  static void configDev() {
    baseUrl = 'https://dog.ceo/api';
  }

  static void configTest() {
    // TODO(boilerplate): flavoring
  }

  static void configProduction() {
    // TODO(boilerplate): flavoring
  }
}

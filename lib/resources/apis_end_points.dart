class ApisEndPoints {
  static const String baseUrl =
      // 'https://9xnitpcah2.execute-api.ap-south-1.amazonaws.com/Prod/';
      'https://0opxpo6j22.execute-api.ap-south-1.amazonaws.com/Prod/';
  static const String login = 'customer/login';
  static const String signUp = 'customer/register';
  static const String start = '/booking/start';
  static const String stop = '/booking/stop';
  static const String station = 'station';
  static const String vehicleCompany = 'vehicle-company';
  static const String vehicleModels = 'vehicle';
  static const String addCustomerEv = 'customer-ev';
  static const String markAsDefault = 'customer-ev/set-default/';
  static const String charger = 'charger';
  static const String bookingOFConnector = 'booking/no-stripe';
  static const String myBookings = 'booking';
}

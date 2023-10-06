///Costanti e stringhe di connessione di tutte le API

class Strings_api {
  Strings_api._();

  //POST DI LOGIN
  static const String LOGIN_USERID_PASSWORD =
      "https://site.goodgo.app/auth/realms/save-my-bike/protocol/openid-connect/token";
  //GET ONBOARDING
  static const String FLOW_ONBOARDING =
      "https://site.goodgo.app/premialita/api/v1/premialita/flow/onboarding/IT";

//----------------------------------PREMIALITA'---------------------
  static const String MY_GEOKOIN =
      "https://site.goodgo.app/premialita/api/v1/premialita/my-gekoin";

//PROFILE
  static const String MY_PROFILE =
      "https://site.goodgo.app/premialita/api/v1/premialita/my-profile";

  //-----------------------------BIKE ---------------------------
  //GET my-bikes
  static const String GET_MY_BIKES = "https://site.goodgo.app/api/my-bikes/";
  //POST bike-observations
  static const String BIKE_OBSERVATION =
      "https://site.goodgo.app/api/bike-observations/";
  //GET
  static const String MY_BIKES_OBSERVATION =
      "https://site.goodgo.app/api/my-bike-observations/";
  //GET
  static const String MY_BIKE_STATUSES =
      "https://site.goodgo.app/api/my-bike-statuses/";
//-------------------------------BADGES----------------------------------
  //GET
  static const String MY_BADGES = "https://site.goodgo.app/api/my-badges/";
//----------------------------COMPETITONS------------------------
  static const String MY_COMPETITIONS_AVAIABLE =
      "https://site.goodgo.app/api/my-competitions-available/";
  static const String MY_COMPETITIONS_CURRENT =
      "https://site.goodgo.app/api/my-competitions-current/";
  static const String MY_COMPETITIONS_WON =
      "https://site.goodgo.app/api/my-competitions-won/";
  //---------------------------DEVICE---------------------------
  static const String MY_DEVICES = "https://site.goodgo.app/api/my-devices/";

  //----------------------SEGMENTS-----------------------------

  static const String MY_SEGMENTS = "https://site.goodgo.app/api/my-segments/";

//-----------------------TAGS-----------------------------------

  static const String MY_TAGS = "https://site.goodgo.app/api/my-tags/";

// -----------------------------TRACKS------------------------------

  static const String MY_TRACKS = "https://site.goodgo.app/api/my-tracks/";

//-----------------------------USER --------------------------------
  static const String MY_USERS = "https://site.goodgo.app/api/my-user";

//---------------------------STANDINGS-----------------------------
  static const String MY_STANDINGS =
      "https://site.goodgo.app/premialita/api/v1/premialita/my-standings";

// ------------------------DETAIL STANDINGS
  static const String MY_STANDINGS_DETAILS =
      "https://site.goodgo.app/premialita/api/v1/premialita/detail-competition/";


//-----------------------------DRIVERS
static const String DRIVER = "API DEL DRIVER";

//-------------------------CLIENTS
static const String CLIENT_JOBS = "API DEI LAVORI AGGIUNTIVI";

//-------------------------CONCESSIONARIA
static const String CONCESSIONARIA = "API CONCESSIONARIA";



}

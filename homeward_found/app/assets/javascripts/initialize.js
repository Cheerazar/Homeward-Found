$(document).ready(function() {
  //  ---------------------------- MAP
  var mapModel = new MapModel();
  var lostings = new Lostings();
  var sightings = new Sightings()
  var markers = new Marker(lostings, sightings)
  var mapController = new MapController(mapModel, markers);
  mapController.getLocation();
  lostings.getLostings()
  sightings.getSightings()
  // mapController.initialize();
  //  ---------------------------- ROUTES
  var routeModel = new RouteModel();
  var routeController = new RouteController(routeModel, mapController)
  routeController.initialize()

  //  ---------------------------- FORM
  var formController = new FormController();
  formController.initialize()


  //  ---------------------------- RIVER
  var riverView = new RiverView();
  var riverController = new RiverController(riverView);
  riverController.startLostings();


// $("#new_losting").on("ajax:success", routeModel.lostingRiver);

  //  ---------------------------- LOGIN
  var loginModel = new LoginModel()
  var loginController = new LoginController(loginModel)
  loginController.initialize()
  $("#aside_nav").on("click", "#lost_side", riverController.startLostings)
  $("#aside_nav").on("click", "#sight_side", riverController.startSightings)
  $("#lost_side").on("click", routeModel.lostingRiver);
  $("#sight_side").on("click", routeModel.sightingRiver);


  $("#event-container").on("submit", "#new_losting", routeModel.createLosting)
  $("#event-container").on("submit", "#new_sighting", routeModel.createSighting)
    google.maps.event.addDomListener(window, 'load', mapController.createMap);

});
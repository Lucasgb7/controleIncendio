var app = angular.module('app',['ngRoute', 'ngSanitize']);

app.config(function($routeProvider){
   $routeProvider
   // para a rota '/', carregaremos o template home.html e o controller 'HomeCtrl'
   .when("/", {
      controller  : 'LoginCtrl',
      templateUrl : "app/views/login.html"
   })
   // para a rota '/sobre', carregaremos o template sobre.html e o controller 'SobreCtrl'
   .when('/sobre', {
      templateUrl : 'app/views/home.html',
      controller  : 'HomeCtrl',
   })
   // para a rota '/contato', carregaremos o template contato.html e o controller 'ContatoCtrl'
   .when('/contato', {
      templateUrl : 'app/views/contato.html',
      controller  : 'ContatoCtrl',
   })
   // caso não seja nenhum desses, redirecione para a rota '/'
   .otherwise ({ redirectTo: '/' });
});
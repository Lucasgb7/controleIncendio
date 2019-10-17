// Your web app's Firebase configuration
var firebaseConfig = {
    apiKey: "AIzaSyB_BzCKcASM9HP6FaL4wDjE2MQ-YoldhAA",
    authDomain: "controle-de-incendio.firebaseapp.com",
    databaseURL: "https://controle-de-incendio.firebaseio.com",
    projectId: "controle-de-incendio",
    storageBucket: "controle-de-incendio.appspot.com",
    messagingSenderId: "316433358154",
    appId: "1:316433358154:web:7d767cfae891fbf754f5b3"
};
// Initialize Firebase
firebase.initializeApp(firebaseConfig);

var app = angular.module('app',['ngRoute', 'firebase'])
.config(function($routeProvider, $locationProvider){
    $routeProvider
    .when('/', {
        templateUrl : 'app/views/login.html',
        controller  : 'LoginCtrl',
    })

    .when('/home', {
        templateUrl : 'app/views/home.html',
        controller  : 'HomeCtrl',
    })
    

    .when('/instalacoes', {
        templateUrl : 'app/views/instalacoes.html',
        controller  : 'InstalacoesCtrl',
    })

    .when('/ocorrencias', {
        templateUrl : 'app/views/ocorrencias.html',
        controller  : 'OcorrenciasCtrl',
    })

    .when('/cadastrarCliente', {
        templateUrl : 'app/views/cadastrarCliente.html',
        controller  : 'CadastrarClienteCtrl',
    })

    .when('/cadastrarInstalacao', {
        templateUrl : 'app/views/cadastrarInstalacao.html',
        controller  : 'CadastrarInstalacaoCtrl',
    })

    .otherwise ({ redirectTo: '/' });
})
.controller('LoginCtrl', function($scope, $firebaseArray){
    $scope.login = function(){
        window.location.href = "#/home"
    }
})
.controller('HomeCtrl', function($scope, $firebaseArray){
    const ref = firebase.database().ref("cliente_final");
    $scope.clientes = $firebaseArray(ref);
})
.controller('InstalacoesCtrl', function($scope, $firebaseArray){
	const ref = firebase.database().ref("instalacao");
    $scope.instalacoes = $firebaseArray(ref);
})
.controller('OcorrenciasCtrl', function($scope, $firebaseArray){
	const ref = firebase.database().ref("ocorrencias");
    $scope.ocorrencias = $firebaseArray(ref);
})
.controller('CadastrarClienteCtrl', function($scope, $firebaseArray){
	$scope.addCliente = function(){
		var ref = firebase.database().ref("cliente_final");
		$firebaseArray(ref).$add($scope.cliente)
		.then(
			function(ref){
				$scope.cliente.nome = "";
				$scope.cliente.tipo = "";
                $scope.cliente.cpf = "";
                $scope.cliente.cnpj = "";
                $scope.cliente.telefone = "";
			},
			function(error){
				console.log(error);
			})
	};
})
.controller('CadastrarInstalacaoCtrl', function($scope, $firebaseArray){
	$scope.addInstalacao = function(){
		var ref = firebase.database().ref("instalacao");
		$firebaseArray(ref).$add($scope.instalacao)
		.then(
			function(ref){
				$scope.instalacao.data = "";
                $scope.instalacao.cliente = "";
                $scope.instalacao.dispositivo = "";
                $scope.instalacao.cep = "";
                $scope.instalacao.logradouro = "";
                $scope.instalacao.numero = "";
                $scope.instalacao.referencia = "";
                $scope.instalacao.bairro = "";
                $scope.instalacao.municipio = "";
                $scope.instalacao.uf = "";
			},
			function(error){
				console.log(error);
			})
	};
});

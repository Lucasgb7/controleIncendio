app.controller('LoginCtrl', function($scope, $firebaseObject){
    const rootRef = firebase.database().ref().child('controle-de-incendio');
    const ref = rootRef.child('servico_seguranca');
    this.object = $firebaseObject(ref);
});

app.controller('HomeCtrl', function($scope){
    
});

app.controller('InstalacoesCtrl', function($scope){
	
});

app.controller('OcorrenciasCtrl', function($scope){
	
});

app.controller('CadastrarClienteCtrl', function($scope){
	
});

app.controller('CadastrarInstalacaoCtrl', function($scope){
	
});
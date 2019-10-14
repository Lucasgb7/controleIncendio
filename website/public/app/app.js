var app = angular.module('app',['ngRoute', 'firebase']);

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
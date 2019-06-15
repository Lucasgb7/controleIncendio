<?php
session_start();

unset($_SESSION['login']);
unset($_SESSION['id_servico_seguranca']);

header('location:index.php');
<?php
    include "database.php";

    $querry = "SELECT id, nome FROM cliente_final WHERE ativo = true";
    $consulta_pessoa_fisica = pg_query($connection, $querry) or die(pg_last_error());
?>

<div>
    <h1 class="title-sec">Clientes</h1>
    <table class="table table-striped table-bordered table-select" style="width:100%">
        <tbody>
        <?php
            $i = 0;
            while($linha = pg_fetch_array($consulta_pessoa_fisica, $i)){
                echo '<tr><td>'.$linha['nome'].'</td>';
                echo '<td><a href="?pagina=cadastrar_cliente_final&id='.$linha['id'].'" class="btn btn-default">Editar</a></td>';
                echo '<td><a href="excluir_cliente_final.php?id='.$linha['id'].'" class="btn btn-default" style="border-radius:50%;">X</a></td></tr>';
                $i += 1;
            }
        ?>
        <tbody>
    <table>
    <a href="?pagina=cadastrar_cliente_final" class="btn btn-default fab" style="border-radius:50%;">+</a> 
</div>
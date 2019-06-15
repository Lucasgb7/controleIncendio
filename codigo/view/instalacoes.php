<?php
    include "database.php";

    $querry = "SELECT instalacao.id, instalacao.data_instalacao, instalacao.dispositivo, endereco.logradouro, cliente_final.nome
               FROM instalacao
               INNER JOIN cliente_final ON (instalacao.cliente_final_id = cliente_final.id)
               INNER JOIN endereco ON (instalacao.endereco_id = endereco.id)";
    $consulta_instalacao = pg_query($connection, $querry) or die(pg_last_error());
?>

<div>
    <h1>Instalações</h1>
    <table class="table table-striped table-bordered" style="width:100%">
        <thead><tr>
            <th>Cliente</th>
            <th>Nº dispositivo</th>
            <th>Data da instalação</th>
            <th>Endereço</th>
        </tr></thead>
        <tbody>
        <?php
            $i = 0;
            while($linha = pg_fetch_array($consulta_instalacao, $i)){
                echo '<tr><td>'.$linha['nome'].'</td>';
                echo '<td>'.$linha['dispositivo'].'</td>';
                echo '<td>'.$linha['data_instalacao'].'</td>';
                echo '<td>'.$linha['logradouro'].'</td>';
                echo '<td><a href="excluir_instalacao.php?id='.$linha['id'].'" class="btn btn-default" style="border-radius:50%;">X</a></td></tr>';
                $i += 1;
            }
        ?>
        <tbody>
    <table>
    <a href="?pagina=cadastrar_instalacao" class="btn btn-default" style="border-radius:50%;">+</a> 
</div>
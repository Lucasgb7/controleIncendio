<?php
    include "database.php";

    $querry = "SELECT ocorrencia.estado, ocorrencia.data_ocorrencia, cliente_final.nome, endereco.logradouro
               FROM ocorrencia
               INNER JOIN instalacao ON (ocorrencia.instalacao_id = instalacao.id)
               INNER JOIN cliente_final ON (instalacao.cliente_final_id = cliente_final.id)
               INNER JOIN endereco ON (instalacao.endereco_id = endereco.id)";
    $consulta_ocorrencia = pg_query($connection, $querry) or die(pg_last_error());
?>

<div>
    <h1>Ocorrências</h1>
    <table class="table table-striped table-bordered" style="width:100%">
        <tbody>
        <?php
            $i = 0;
            while($linha = pg_fetch_array($consulta_ocorrencia, $i)){
                $cor='';
                if($linha['estado'] == 1) $cor = 'red';
                else if($linha['estado'] == 2) $cor = 'yellow';
                else $cor = 'green';
                echo '<tr><td><span class="dot" style="background-color:'.$cor.';"></span></td>';
                echo '<td>'.$linha['nome'].'</td>';
                echo '<td>'.$linha['logradouro'].'</td>';
                echo '<td>'.$linha['data_ocorrencia'].'</td></tr>';
                $i += 1;
            }
        ?>
        <tbody>
    <table>
</div>
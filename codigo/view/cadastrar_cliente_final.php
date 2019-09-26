<?php
    include 'database.php';

    if(isset($_GET['id'])){
        $id = $_GET['id'];
        $query = "SELECT * FROM cliente_final WHERE id = $id";
        $consulta_cliente = pg_query($connection, $query) or die (pg_last_error());
        $linha_cliente = pg_fetch_array($consulta_cliente, 0);
        if($linha_cliente['tipo_pessoa'] == 'f'){
            $query = "SELECT cpf FROM pessoa_fisica WHERE cliente_id = $id";
            $consulta_pessoa = pg_query($connection, $query) or die (pg_last_error());
            $linha_pessoa = pg_fetch_array($consulta_pessoa, 0);
        }else{
            $query = "SELECT cnpj FROM pessoa_juridica WHERE cliente_id = $id";
            $consulta_pessoa = pg_query($connection, $query) or die (pg_last_error());
            $linha_pessoa = pg_fetch_array($consulta_pessoa, 0);
        }
    }
?>

<div>
    <h1 class="title-sec">Cadastrar Cliente</h1>
    <div class="container cadastro-container">
    <div class="jumbotron">
    <form method="post" action="processa_cadastrar_cliente_final.php">
        <input name="id_cliente" type="hidden" value="<?php echo $id ?>">
        <span>Nome: </span><input type="text" class="form-control" name="nome" placeholder="Digite o nome do cliente" value="<?php echo $linha_cliente['nome'];?>" required>
        <input type="radio" name="pessoa" value="f" <?php if($linha_cliente['tipo_pessoa']=='f')echo 'checked';?> required>Pessoa Física
        <input type="radio" name="pessoa" value="j" <?php if($linha_cliente['tipo_pessoa']=='j')echo 'checked';?> required>Pessoa Jurídica
        <br><br>
        <span>CPF: </span><input type="text" class="form-control" name="cpf" value="<?php echo $linha_pessoa['cpf'];?>">
        <span>ou</span><br><br>
        <span>CNPJ: </span><input type="text" class="form-control" name="cnpj" value="<?php echo $linha_pessoa['cnpj'];?>">
        <br>
        <input type="submit" class="btn btn-default btn-md cadastrar-btn" value="Salvar">
    </form>
    </div>
    </div>
</div>
<div>
    <form method="post" action="processa_cadastrar_instalacao.php">
        <span>Data: </span><input name="data_instalacao" type="date" required>
        <span>Cliente: </span><input id="cliente_nome" name="cliente_nome" type="text" onkeyup="showResult(this.value,this.id)" required>
        <div class="autocomplete" id="livesearchcliente_nome"></div>
        <span>Nº dispositivo: </span><input name="numero_dispositivo" type="number">
        <span>Endereço</span>
        <span>Cep: </span><input id="cep" name="cep" type="text">
        <span>Logradouro: </span><input id="logradouro" name="logradouro" type="text">
        <span>Número: </span><input id="complemento" name="complemento" type="text">
        <span>Referencia: </span><input id="referencia" name="referencia" type="text">
        <span>Bairro: </span><input id="bairro" name="bairro" type="text">
        <span>Município: </span><input id="cidade" name="cidade" type="text">
        <span>UF: </span><input id="uf" name="uf" type="text">
        <input type="submit" class="btn btn-default btn-md" value="Cadastrar">
    </form>
</div>
<script>
    $("#cep").focusout(function(){
        $(this).val().replace('-', '');
        $(this).val().replace('.', '');
        $.ajax({
            url: 'https://viacep.com.br/ws/'+$(this).val()+'/json/unicode/',
            dataType: 'json',
            success: function(resposta){
                $("#logradouro").val(resposta.logradouro);
                $("#complemento").val(resposta.complemento);
                $("#bairro").val(resposta.bairro);
                $("#cidade").val(resposta.localidade);
                $("#uf").val(resposta.uf);
            }
        });	
    });

    function showResult(str, id_input) {
        var id = "livesearch"+id_input;
        if (str.length==0) { 
            document.getElementById(id).innerHTML="";
            document.getElementById(id).style.border="0px";
            return;
        }
        if (window.XMLHttpRequest) {
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp=new XMLHttpRequest();
        } else {  // code for IE6, IE5
            xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange=function() {
            if (this.readyState==4 && this.status==200) {
                document.getElementById(id).innerHTML=this.responseText;
                document.getElementById(id).style.border="1px solid #A5ACB2";
            }
        }
        xmlhttp.open("GET","livesearch.php?q="+str+"&id="+id_input,true);
        xmlhttp.send();
    }

    function selecionaComplete(value, id_input){
        var id = "livesearch"+id_input;
        document.getElementById(id_input).value = value;
        document.getElementById(id).innerHTML="";
        document.getElementById(id).style.border="0px";
    }
</script>
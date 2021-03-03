<?php
    function accesoBD($servername, $username, $pass, $db){
        // Crear Conexion
        $conexion = new mysqli($servername, $username, $pass, $db);
        
        //Comprobar conexion
        if($conexion->connect_error){
            header('Location: index.html');
            //die("Conexion fallida: ".$conexion->connect_error);
        }else{
            $conexion->close();
        }
    } 



    function consultaDB($servername, $username, $pass, $db, $sql){
        // Crear Conexion
        $conexion = mysqli_connect($servername, $username, $pass, $db);
        
        //Comprobar conexion
        if($conexion->connect_error){
            header('Location: index.html');
            //die("Conexion fallida: ".$conexion->connect_error);
        }

        $result = mysqli_query($conexion, $sql);
        
        if (mysqli_num_rows($result) > 0){
            echo '<div class="container modal-personalizado"><p>Resultado de la consulta -> ' . $sql . '</p><table class="table">';
            while($fila = mysqli_fetch_array($result)){
                echo '<tr>';
                for($col = 0; $col < mysqli_num_fields($result); $col++){
                    echo '<td>' . $fila[$col] . ' </td>';
                }
                echo '</tr>';
            }
            echo '</table>';
            echo '</div>';
            $_SESSION['error'] = '';
        }else{
            $_SESSION['error'] = 'Consulta incorrecta.';
            header('Location: procesar.php');
        }
              
        $conexion->close();
    }
    
?>
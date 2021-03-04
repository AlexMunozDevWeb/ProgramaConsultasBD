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


    function manipulacionDB($servername, $username, $pass, $db, $sql, $tipoQuery){

        // Crear Conexion
        $conexion = mysqli_connect($servername, $username, $pass, $db);
        
        //Comprobar conexion
        if($conexion->connect_error){
            header('Location: index.html');
            //die("Conexion fallida: ".$conexion->connect_error);
        }

        switch ($tipoQuery) {

            case 'Select':
                $result = mysqli_query($conexion, $sql);
        
                if (mysqli_num_rows($result) > 0){
                    echo '<div class="container modal-personalizado"><p>Resultado de la consulta: </br> ' . $sql . '</p><table class="table">';
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
                
                break;

            case 'Insert':

                $_SESSION['error'] = ''; // Para vaciar el error de la consulta
                if (mysqli_query($conexion, $sql)) {
                    echo "Modificacion correcta."; 
                } else {
                    echo "<p class='text-danger'>Error en la sintaxis:</br> " . mysqli_error($conexion) . '</p>'; 
                }
                
                break;

            case 'Multiquery':

                $_SESSION['error'] = ''; // Para vaciar el error de la consulta
                if (mysqli_multi_query($conexion, $sql)) { 
                    echo "Multiquery creada correctamente.";
                } else { 
                    echo "<p class='text-danger'>Error en la sintaxis:</br> " . mysqli_error($conexion) . '</p>'; 
                }
                
                break;
        }
        
        $conexion->close();
    }

?>
<?php
    require_once('conexionBD.php');
    
    session_start();

    if(isset($_POST['conectar'])){
          $_SESSION['server'] = $_POST['server'];
          $_SESSION['user'] = $_POST['user'];
          $_SESSION['pass'] = $_POST['pass'];
          $_SESSION['database'] = $_POST['database'];
          accesoBD($_SESSION['server'],$_SESSION['user'],$_SESSION['pass'],$_SESSION['database']);
    }

    if(isset($_POST['desconectar'])){
        session_destroy();
        header('Location: index.html');
    }

?>

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Consultas</title>

  <!-- FontAwesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
    integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA=="
    crossorigin="anonymous" />
  <!-- Google Fonts -->
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link
    href="https://fonts.googleapis.com/css2?family=Open+Sans&family=Oxygen&family=Ubuntu:ital,wght@0,300;0,500;0,700;1,300&display=swap"
    rel="stylesheet">

  <!-- Bootstrap core CSS -->
  <link href="css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/styles.css" rel="stylesheet">

</head>

<body class="body-login">
  <main class="centrar-contenido">
    <article class="card">

      <div class="card-body">

        <form method="post" action="procesar.php">

          <div class="form-group">
            <label for="username">Consulta:</label>
            <textarea class="form-control" name="textConsulta" id="exampleFormControlTextarea1" rows="3" require></textarea>
          </div>

          <div class="form-group text-center m-0">
            <button type="submit" name="consulta" class="btn btn-success btn-lg m-2">Consulta</button>
            <button type="submit" name="desconectar" class="btn btn-danger btn-lg m-2">Desconectar</button>
          </div>

        </form>
        
        <?php 
            if(isset($_POST['consulta'])){
                if(!empty($_POST['textConsulta'])){
                  $sql = $_POST['textConsulta'];
                  consultaDB($_SESSION['server'],$_SESSION['user'],$_SESSION['pass'],$_SESSION['database'],$sql);
                }else{
                   $_SESSION['error'] = 'Consulta vacia.';
                }
            }
        ?>
        <p class="text-danger">
          <?php 
            if(isset($_SESSION['error']) || !empty($_SESSION['error'])){
              echo $_SESSION['error'];
            }
          ?>
        </p>

      </div>
    </article>
  </main>
</body>

</html>
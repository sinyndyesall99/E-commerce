<?php
  require('./DBtransaction.php');
  $transaction = new DBTransaction();
  $allProduct = $transaction->getAllproduct();

  $nom = "Gaz"; //$_POST['nom'];
  $description = "Description du gaz"; // $_POST['description'];
  $prixU = 2000; //$_POST['prixU'];
  $img = ""; //$_POST['img'];
  $id_boutiquier= 2; //$_SESSION['user']['id'];

  //$transaction->createProduct($nom,$description,$prixU,$img,$id_boutiquier);

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <table>
        
            <thead>
                <tr>
                    <th>Nom product</th>
                    <th>description</th>
                    <th>prix U</th>

                </tr>
            </thead>
</body>
<?php foreach($allProduct as $key=>$Product){?>
        <tr>
<td><?=$product['nom']></td>
<td><?=$product['description']></td>
<td><?=$product['prixU']></td>
</tr>
<?php} ?>
</html>
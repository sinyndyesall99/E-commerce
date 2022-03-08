<?php
class DBTransaction{
    public $database; // pour les transactions

    public function __construct(){
        if ($this->database == null){
            $urlDB="mysql:hqst=localhost;dbname=E-commerce"; // lien qui mene sur la base de donnée
            $username='root';
            $password='';
            $this->database = new PDO($urlDB,$username, $password); //pour la connexion sur la base de donnée
            $this->database->setAttribute(PDO:: ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC); // renvoyer sour forme de tableau associatif

        }
    }
    public function getAllProduit(){ 
        //pour recuperer les produit
        $result = $this->database->query("SELECT*FROM Produit");
        
        return $result->fetchAll();
    }

    public function createProduct($nom, $description, $prixU, $img, $id_BOUTIQUE){
        $result = $this ->database ->query("INSERT INTO  `Produit` VALUE(NULL, '$nom', '$description', '$prixU', '$img', '$id_BOUTIQUE' )");
        return $result->fetchAll();
    }
 }

?>
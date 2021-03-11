<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Acceuil.aspx.cs" Inherits="APP_PJ_STAGE_TDI203.Acceuil" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title> Acceuil | OFPPT </title>
    <link href="style/css/bootstrap.min.css" rel="stylesheet" />
    <style>

        body{
            overflow:hidden;
        }
        #demo{
            height:100vh;
            width:100vw;
        }
        img{
            height:100vh;
            width:100%;
        }
        .carousel-inner{
            width:100%;
            height:100vh;
        }
        .btnn{
            position:absolute;
            top: 20px;
            right:20px;
            z-index:1000;

        }

    </style>
</head>
<body>

      

  
    <!--slides-->

    <div class="logo"></div>

<div id="demo" class="carousel slide" data-ride="carousel">
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="img/slides/slide1.png" alt="Los Angeles"/>
      <div class="carousel-caption">
        <h1 >OFPPT au Maroc</h1>
        <p>

             LOffice de la Formation Professionnelle et de la Promotion du Travail, appelé OFPPT, est un établissement public et un opérateur national 
             de formation professionnelle créé en 1974 et ayant pour objectif de former les jeunes afin qu'ils soient forts et compétents à cet ère de la 
             mondialisation où la coirssance va de pair avec la compétitivité des entreprises. 

        </p>

          
         
      </div>   
    </div>
    <div class="carousel-item">
      <img src="img/slides/slide2.png" alt="Chicago" width="1100" height="500"/>
      <div class="carousel-caption">
        <h1> OFPPT en chiffre :  </h1>
          <p>   
               L'OFPPT c'est 303 établissements de formation, 10 directions générales, 223 métiers, 8204 
               collaborateurs dont 5711 formateurs
               et comtant 250.000 stagiaires en formation, mais surtout un taux d'insertion de 70% à 100%.
          </p>
      </div>   
    </div>
    <div class="carousel-item">
      <img src="img/slides/slide3.jpg" alt="New York" />
      <div class="carousel-caption">
      </div>   
    </div>
  </div>
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>
    <a class="btnn btn btn-outline-light" href="inscription.aspx">INSCRIPTION </a>
   
    <script src="style/jquery/jquery.js"></script>
    <script src="style/js/bootstrap.min.js"></script>
    </body>
</html>

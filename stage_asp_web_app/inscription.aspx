<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="inscription.aspx.cs" Inherits="APP_PJ_STAGE_TDI203.home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home | ofppt</title>
<link href="style/style.css" rel="stylesheet" />
    <style>

        *{margin:0;
          padding:0;
          box-sizing:border-box;
        }
        body{
            color:#333;
            background-color: #2a8f92;
        }
        .form{
            background-color:#fff;
            width: 40%;
            margin: 100px auto ;
            text-align:center;
            padding: 2rem;
            border-radius:10px;
        }
        form {
            width: 100%;
            border-radius: 10px;
        }
        label {
            font-size: 1.5rem;
        }
        label::after{
            content:"  :";
        }
        .form-control {
            width: 50%;
            font-size:1.5rem;
        }
        .h1{
            font-size:3rem;
        }
        .group-form{
            width:85%;
            text-align:center;
            display: flex;
            justify-content:space-between;
            align-items:center;
            height: 92px;
        }
        .custom-select{
            width: 50%;
            padding: .7rem;
            height:3.3rem;
        }
        .btn {
            padding: 1rem 3rem;
            font-size: 1.5rem;
        }
        @media only screen and (max-width: 900px) {

            html{
                font-size:80%;
            }
            .form{
                width:70%;
            }
        }
        @media only screen and (max-width: 600px) {

            html{
                font-size:70%;
            }
            .group-form{
                width:90%;
            }
            .form{
                width:80%;
            }
        }
        @media only screen and (max-width: 400px) {

            html{
                font-size:60%;
            }
            .group-form {
                flex-direction:column;
            }
            .form{
                width:90%;
            }
        }
        
    </style>
</head>
<body>
    <div class="form" >
        <h1>
            <asp:Label ID="visit" runat="server" Font-Bold="True" Font-Size="Medium"></asp:Label>
        </h1>
    <h1 class="h1 text-uppercase" id="home">Inscription </h1>
    <form id="form1" runat="server">
        <div class="group-form" >
            <label for="cin" >CIN</label>
            <asp:TextBox CssClass="form-control" ID="cin" runat="server"></asp:TextBox>
            
        </div>
        <div class="group-form">
            <label for="prenom">Prénom</label>
            <asp:TextBox CssClass="form-control" ID="prenom" runat="server"></asp:TextBox>
            
        </div>
        <div class="group-form">
            <label for="nom">Nom</label>
            <asp:TextBox CssClass="form-control" ID="nom" runat="server"></asp:TextBox>
            
        </div>
        <div class="group-form">
            <label for="d_naiss">Date Naissance </label>
            <asp:TextBox CssClass="form-control" ID="d_naiss" TextMode="Date" runat="server"></asp:TextBox>
             
             </div>
        <div class="group-form" >
        <label for="DDNScoilare">Niveau Scolaire</label> 
        <asp:DropDownList CssClass="custom-select" ID="DDNScoilare" runat="server"  OnSelectedIndexChanged="DDNScoilare_SelectedIndexChanged" AutoPostBack="True">
        </asp:DropDownList>
        </div>
        <div class="group-form" >
        <label for="DDNformation">Niveau Formation </label>
         <asp:DropDownList CssClass="custom-select" ID="DDNformation" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DDNformation_SelectedIndexChanged">
        </asp:DropDownList>
           
            </div>
        <div class="group-form" >
        <label for="DDSecteur">Secteur</label>
         <asp:DropDownList CssClass="custom-select" ID="DDSecteur" runat="server"  AutoPostBack="True" OnSelectedIndexChanged="DDSecteur_SelectedIndexChanged">
        </asp:DropDownList>
            </div>
        <div class="group-form" >
        <label for="DDFiliere">Filiers</label>
         <asp:DropDownList CssClass="custom-select" ID="DDFiliere" runat="server"  AutoPostBack="True">
        </asp:DropDownList>
        </div>
        <asp:Button CssClass="btn btn-primary" ID="valiider" runat="server" Text="valider" OnClick="valiider_Click" />
    </form>
        </div>
</body>
</html>

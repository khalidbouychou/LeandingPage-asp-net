<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="details.aspx.cs" Inherits="APP_PJ_STAGE_TDI203.details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Details | Filier </title>
<link href="style/css/bootstrap.min.css" rel="stylesheet" />
<script src="style/js/bootstrap.min.js"></script>
    <style>
        *{
            margin-left:5%;
            margin-right:5%;
            padding:0px;
            font-size:11px;
        }
    </style>
</head>
<body>
    <form id="form1"  runat="server">
        <div id="content">
        <asp:Label ID="title" runat="server" Font-Bold="True" Font-Size="XX-Large"></asp:Label>
    <div>
    
        <asp:Label ID="info" runat="server"></asp:Label>
    </div>
        <div>
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="False" Font-Size="Large" Text="Profile de formation"></asp:Label>
        </div>
        
       
         <div>
              <asp:Label ID="profil" runat="server"></asp:Label>
         </div>
       
        
       <div>
           <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Italic="False" Font-Size="Large" Text="Conditions"></asp:Label>
       
       </div>
        
        <div>
            <asp:Label ID="conditions" runat="server"></asp:Label>
        </div>
        <div>
            <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Italic="False" Font-Size="Large" Text="Debouches"></asp:Label>
        <br />
        </div>
         
       <div>
        <asp:Label ID="debouche" runat="server"></asp:Label>

       </div>
        
        
   </div>

        <div style="text-align:center" >
               <input type="button" class="btn btn-info" value="Telecharger les details" id="btnPrint" />
        </div>
     
    </form>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">
        $("#btnPrint").live("click", function () {
            var divContents = $("#content").html();
            var printWindow = window.open('', '', 'height=400,width=800');
            printWindow.document.write('<html><head><title>filiere_details</title>');
            printWindow.document.write('</head><body >');
            printWindow.document.write(divContents);
            printWindow.document.write('</body></html>');
            printWindow.document.close();
            printWindow.print();
        });
    </script>
</body>
</html>

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace APP_PJ_STAGE_TDI203
{
    public partial class details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Filiere filiere = (Filiere)Session["Filiere"];
            title.Text = filiere.name;
            info.Text = filiere.details;
            profil.Text = filiere.profile_de_formation;
            conditions.Text = filiere.conditions;
            debouche.Text = filiere.debouches;
        }
    }
}
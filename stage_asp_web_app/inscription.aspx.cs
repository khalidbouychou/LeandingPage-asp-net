using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace APP_PJ_STAGE_TDI203
{
    public partial class home : System.Web.UI.Page
    {   //---------DECLARATION ------
        string niveaFormation;
        string name_liste;
        Filiere filiere;
        //-------- methode 
        public Boolean visiteur_exisit(string cin)
        {
            SqlDataReader rdr = null;
            SqlConnection con = new SqlConnection(@"Data Source=KH_B\SQLEXPRESS;Initial Catalog=db_stage;Integrated Security=True");
            string selectSql = "SELECT * FROM users WHERE cin = '" + cin + "'";
            SqlCommand cmd = new SqlCommand(selectSql, con);

            con.Open();
            rdr = cmd.ExecuteReader();

            if (rdr.HasRows)
                return true;

            return false;
        }

        public void add_user()
        {
            SqlConnection connection = new SqlConnection(@"Data Source=KH_B\SQLEXPRESS;Initial Catalog=db_stage;Integrated Security=True");
            using (SqlCommand command = new SqlCommand())
            {
                command.Connection = connection;
                command.CommandType = CommandType.Text;
                command.CommandText = "INSERT into users (cin, name, last_name, date_nais, niveau_scolaire, niveau_formation, secteure, filiere) " +
                                      "VALUES (@cin, @name, @last_name, @date_nais, @niveau_scolaire, @niveau_formation, @secteure, @filiere)";
                command.Parameters.AddWithValue("@cin", cin.Text);
                command.Parameters.AddWithValue("@name", prenom.Text);
                command.Parameters.AddWithValue("@last_name", nom.Text);
                command.Parameters.AddWithValue("@date_nais", d_naiss.Text);
                command.Parameters.AddWithValue("@niveau_scolaire", DDNScoilare.Text);
                command.Parameters.AddWithValue("@niveau_formation", DDNformation.Text);
                command.Parameters.AddWithValue("@secteure", DDSecteur.Text);
                command.Parameters.AddWithValue("@filiere", DDFiliere.Text);


                connection.Open();
                command.ExecuteNonQuery();
            }
        }

        public List<string> string_to_list(string str)
        {
            return str.Split(',').ToList();
        }

        public string visiteurs()
        {
            SqlConnection con = new SqlConnection(@"Data Source=KH_B\SQLEXPRESS;Initial Catalog=db_stage;Integrated Security=True");
            string selectSql = "SELECT COUNT(*) FROM users";
            SqlCommand cmd = new SqlCommand(selectSql, con);
            Int32 count;
            try
            {

                con.Open();
                count = (Int32)cmd.ExecuteScalar();
            }
            finally
            {
                if (con != null)
                    con.Close();
            }

            if (count <= 1)
                return "visiteur:" + count;
            else
                return "visiteurs:" + count;
        }

        public string get_string(string row, string table, string name)
        {
            SqlDataReader rdr = null;
            SqlConnection con = new SqlConnection(@"Data Source=KH_B\SQLEXPRESS;Initial Catalog=db_stage;Integrated Security=True");
            string selectSql = "SELECT " + row + " FROM " + table + " WHERE name = '" + name + "'";
            SqlCommand cmd = new SqlCommand(selectSql, con);
            try
            {
                con.Open();
                rdr = cmd.ExecuteReader();
                while (rdr.Read())
                    name_liste = (string)rdr[row];
            }
            finally
            {
                if (rdr != null)
                    rdr.Close();

                if (con != null)
                    con.Close();
            }
            return name_liste;
        }

        public Filiere get_filiere(string name)
        {
            SqlDataReader rdr = null;
            SqlConnection con = new SqlConnection(@"Data Source=KH_B\SQLEXPRESS;Initial Catalog=db_stage;Integrated Security=True");
            string selectSql = "SELECT * from filieres WHERE name = '" + name + "'";
            SqlCommand cmd = new SqlCommand(selectSql, con);
            try
            {
                con.Open();
                rdr = cmd.ExecuteReader();
                while (rdr.Read())
                    filiere = new Filiere((string)rdr["name"], (string)rdr["num_module"],
                        (string)rdr["nom_module"], (string)rdr["nbr_horaire"], (string)rdr["details"],
                        (string)rdr["debouches"], (string)rdr["conditions"], (string)rdr["profile_de_formation"]);
            }
            finally
            {
                if (rdr != null)
                    rdr.Close();

                if (con != null)
                    con.Close();
            }
            return filiere;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            visit.Text = visiteurs();
            if (!IsPostBack)
            {
                DDNScoilare.DataSource = string_to_list("bac,niveau bac");
                DDNScoilare.DataBind();
                DDNScoilare.SelectedIndex = 0;
                DDNScoilare_SelectedIndexChanged(null, null);
            }
        }

        protected void DDNScoilare_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DDNScoilare.Text.Equals("bac"))
                niveaFormation = "Technicien Spécialisé,Technicien,Qualification,Spécialisation";
            else if (DDNScoilare.Text.Equals("niveau bac"))
                niveaFormation = "Technicien,Qualification,Spécialisation";

            DDNformation.DataSource = string_to_list(niveaFormation);
            DDNformation.DataBind();

            DDNformation.SelectedIndex = 0;
            DDNformation_SelectedIndexChanged(null, null);
        }

        protected void DDNformation_SelectedIndexChanged(object sender, EventArgs e)
        {
            string txt = get_string("secteurs", "niveaux", DDNformation.Text);
            DDSecteur.DataSource = string_to_list(txt);
            DDSecteur.DataBind();

            DDNformation.SelectedIndex = 0;
            DDSecteur_SelectedIndexChanged(null, null);
        }

        protected void DDSecteur_SelectedIndexChanged(object sender, EventArgs e)
        {
            string txt = get_string("filieres", "secteurs", DDSecteur.Text);
            DDFiliere.DataSource = string_to_list(txt);
            DDFiliere.DataBind();
        }

        protected void valiider_Click(object sender, EventArgs e)
        {
            Session["Filiere"] = get_filiere(DDFiliere.Text);
            if (!visiteur_exisit(cin.Text))
                add_user();
            Response.Redirect("details.aspx");
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace APP_PJ_STAGE_TDI203
{
    public class Filiere
    {
        public String name;
        public String numModule;
        public String nomModule;
        public String num_Horaire;
        public String details;
        public String debouches;
        public String conditions;
        public String profile_de_formation;

        public Filiere(String name, String numModule, String nomModule, String num_Horaire, String details, String debouches, String conditions, String profile_de_formation)
        {
            this.name = name;
            this.numModule = numModule;
            this.nomModule = nomModule;
            this.num_Horaire = num_Horaire;
            this.details = details;
            this.debouches = debouches;
            this.conditions = conditions;
            this.profile_de_formation = profile_de_formation;
        }
    }
}
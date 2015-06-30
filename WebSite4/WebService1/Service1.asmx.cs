using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace WebService1
{
    /// <summary>
    /// Descripción breve de Service1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    // [System.Web.Script.Services.ScriptService]
    public class Service1 : System.Web.Services.WebService
    {
        [WebMethod]
        public string registroEmpleados
(int Cod, String Nombre, String Apellido, int telefono, String direccion, int salario, String rol, String username, String password)
         
        {
            string vel = "";
            try
            {
                string cadConexion = "Source=Cristina;Initial Catalog=PaquetesQuetzal17;Integrated Security=True";
                SqlConnection con = new SqlConnection(cadConexion);
                con.Open();
                string consulta = "Insert into Empleado(Cod_Empleado,nombre_Empleado,apellido_Empleado,Telefono_Empleado,Direccion_Empleado,Salario_Empleado,rol_Empleado,Username_Empleado,Password_Empleado)" 
                    + "Values ("+Cod+",'"+Nombre+"', '"+Apellido+"', "+telefono+",'"+direccion+"',"+salario+",'"+rol+"','"+username+"','"+password+"')";

         

               SqlDataAdapter adap = new SqlDataAdapter(consulta, con);
                SqlCommand cmd;
                cmd = new SqlCommand(consulta, con);
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                vel = "no se pudo" + ex;
            }
            return vel;
        }
    }
}
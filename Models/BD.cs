using System.Data.SqlClient;
using Dapper;

namespace TP_JJOO.Models;

public class BD{

    private static string _connectionString = @"Server=localhost; DataBase=jjoo; Trusted_Connection=True;";

    public static void AgregarDeportista(Deportista dep){
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "INSERT INTO Deportistas(Apellido, Nombre, FechaNacimiento, Foto, IdPais, IdDeporte) VALUES (@pApellido, @pNombre, @pFechaNacimiento, @pFoto, @pIdPais, @pIdDeporte)";
            db.Execute(sql, new{pApellido = dep.Apellido, pNombre = dep.Nombre, pFechaNacimiento = dep.FechaNacimiento, pFoto = dep.Foto, pIdPais = dep.idPais, pIdDeporte = dep.idDeporte} );
        }

    }
    public static void EliminarDeportista(int idDeportista){
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "DELETE FROM Deportistas WHERE IdDeportista = @DeportistaABorrar";
            db.Execute(sql, new{DeportistraABorrar = idDeportista} );
        }
    }

    
}



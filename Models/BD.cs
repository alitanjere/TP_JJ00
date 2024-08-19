using System.Data.SqlClient;
using Dapper;

namespace TP_JJOO.Models;

public class BD{

    private static string _connectionString = @"Server=localhost; DataBase=jjoo; Trusted_Connection=True;";

    public static void AgregarDeportista(Deportista dep){
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "INSERT INTO Deportistas(Apellido, Nombre, FechaNacimiento, Foto, IdPais, IdDeporte) VALUES (@pApellido, @pNombre, @pFechaNacimiento, @pFoto, @pIdPais, @pIdDeporte)";
            db.Execute(sql, new{pApellido = dep.Apellido, pNombre = dep.Nombre, pFechaNacimiento = dep.FechaNacimiento, pFoto = dep.Foto, pIdPais = dep.IdPais, pIdDeporte = dep.IdDeporte} );
        }

    }
    public static void EliminarDeportista(int IdDeportista){
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "DELETE FROM Deportistas WHERE IdDeportista = @DeportistaABorrar";
            db.Execute(sql, new{DeportistraABorrar = IdDeportista} );
        }
    }
    public static Deportista VerInfoDeportista(int IdDeportista){
        Deportista MiDep = null;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "SELECT * FROM Deportistas WHERE IdDeportista = @DeportistaAVer";
            MiDep = db.QueryFirstOrDefault<Deportista>(sql, new { DeportistaAVer = IdDeportista });
        }
        return MiDep;
    }

    public static Pais VerInfoPais(int IdPais){
        Pais MiPais = null;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "SELECT * FROM Paises WHERE IdPais = @PaisAVer";
            MiPais = db.QueryFirstOrDefault<Pais>(sql, new { PaisAVer = IdPais });
        }
        return MiPais;
    }

    public static Deporte VerInfoDeporte(int IdDeporte){
        Deporte MiDeporte = null;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "SELECT * FROM Deportes WHERE IdDeporte = @DeporteAVer";
            MiDeporte = db.QueryFirstOrDefault<Deporte>(sql, new { DeporteAVer = IdDeporte });
        }
        return MiDeporte;
    }
    
    public static List<Pais> ListarPaises(){
        List <Pais> ListPaises = new List<Pais>();
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "SELECT * FROM Paises";
            ListPaises = db.Query<Pais>(sql).ToList();
        }
        return ListPaises;
    }

    public static List <Deporte> ListarDeportes(){
        List <Deporte> ListDeportes = new List<Deporte>();
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "SELECT * FROM Deportes";
            ListDeportes = db.Query<Deporte>(sql).ToList();
        }
        return ListDeportes;
    }

    public static List <Deportista> ListarDeportistasDep(int idDeporte){
        List <Deportista> ListDeportistas = new List<Deportista>();
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "SELECT * FROM Deportistas WHERE IdDeporte = @DeporteSelec";
            ListDeportistas = db.Query<Deportista>(sql, new{DeporteSelec = idDeporte}).ToList();
        }
        return ListDeportistas;
    }
    public static List<Deportista> ListarDeportistasPais(int idPais){
        List <Deportista> ListDeportistas = new List<Deportista>();
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "SELECT * FROM Deportistas WHERE IdPais = @PaisSelec";
            ListDeportistas = db.Query<Deportista>(sql, new{PaisSelec = idPais}).ToList();
        }
        return ListDeportistas;
    }

}



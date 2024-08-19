using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TP_JJOO.Models;

namespace TP_JJOO.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        return View("Index");
    }
    public IActionResult Deportes()
    {
        ViewBag.ListaDeportes = BD.ListarDeportes();
        return View();
    }

    public IActionResult Paises()
    {
        ViewBag.ListaPaises = BD.ListarPaises();
        return View();
    }
    public IActionResult Creditos()
    {
        return View();
    }

    public IActionResult AgregarDeportista()
    {
        ViewBag.ListaDeportes = BD.ListarDeportes();
        ViewBag.ListaPaises = BD.ListarPaises();

        return View();
    }
    public IActionResult VerDetalleDeporte(int IdDeporte){

        ViewBag.DeportistasPorDeporte = BD.ListarDeportistasDep(IdDeporte);
        ViewBag.NombreDeporte = BD.VerInfoDeporte(IdDeporte).Nombre;
        ViewBag.FotoDeporte = BD.VerInfoDeporte(IdDeporte).Foto;
        return View("VerDetalleDeporte");

    }
    public IActionResult VerDetallePais(int IdPais){

        ViewBag.DeportistasPorPais = BD.ListarDeportistasPais(IdPais);
        ViewBag.NombrePais = BD.VerInfoPais(IdPais).Nombre;
        ViewBag.FotoPais = BD.VerInfoPais(IdPais).Bandera;
        ViewBag.FechaPais = BD.VerInfoPais(IdPais).FechaFundacion;
        return View("VerDetallePais");

    }
    public IActionResult VerDetalleDeportista(int IdDeportista){

        ViewBag.NombreDeportista = BD.VerInfoDeportista(IdDeportista).Nombre;
        ViewBag.ApellidoDeportista = BD.VerInfoDeportista(IdDeportista).Apellido;
        ViewBag.FechaDeportista = BD.VerInfoDeportista(IdDeportista).FechaNacimiento;
        ViewBag.FotoDeportista = BD.VerInfoDeportista(IdDeportista).Foto;
        ViewBag.IDDeporteDeportista = BD.VerInfoDeportista(IdDeportista).IdDeporte;
        ViewBag.IDPaisDeportista = BD.VerInfoDeportista(IdDeportista).IdPais;
        return View("VerDetalleDeportista");

    }
    
    public IActionResult Historia(){
        return View();
    }

    [HttpPost] public  IActionResult GuardarDeportista(Deportista dep){
        BD.AgregarDeportista(dep);
        return View("Index");
    }
    public IActionResult EliminarDeportista(int idCandidato){
        BD.EliminarDeportista(idCandidato);
        return View("Index");

    }

}


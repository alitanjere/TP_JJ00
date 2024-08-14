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
    public IActionResult VerDetalleDeporte(int idDeporte){

        ViewBag.DeportistasPorDeporte = BD.ListarDeportistasDep(idDeporte);
        ViewBag.NombreDeporte = BD.VerInfoDeporte(idDeporte).Nombre;
        ViewBag.FotoDeporte = BD.VerInfoDeporte(idDeporte).Foto;
        return View("VerDetalleDeporte");

    }
    public IActionResult VerDetallePais(int idPais){

        ViewBag.DeportistasPorPais = BD.ListarDeportistasPais(idPais);
        ViewBag.NombrePais = BD.VerInfoPais(idPais).Nombre;
        ViewBag.FotoPais = BD.VerInfoPais(idPais).Bandera;
        ViewBag.FechaPais = BD.VerInfoPais(idPais).FechaFundacion;
        return View("VerDetallePais");

    }
    public IActionResult VerDetalleDeportista(int idDeportista){

        ViewBag.NombreDeportista = BD.VerInfoDeportista(idDeportista).Nombre;
        ViewBag.ApellidoDeportista = BD.VerInfoDeportista(idDeportista).Apellido;
        ViewBag.FechaDeportista = BD.VerInfoDeportista(idDeportista).FechaNacimiento;
        ViewBag.FotoDeportista = BD.VerInfoDeportista(idDeportista).Foto;
        return View("VerDetalleDeportista");

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


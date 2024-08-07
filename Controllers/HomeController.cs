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
        ViewBag.NombreDeporte = BD.ListarDeportes[idDeporte].Nombre;
        return View();

    }
}

using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using myfinance_web_netcore_.Infrastructure;
using myfinance_web_netcore_.Models;

namespace myfinance_web_netcore_.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;
    private MyFinanceDBContext _myFinanceDbContext;

    public HomeController(
        ILogger<HomeController> logger,
        MyFinanceDBContext myFinanceDbContext)
    {
        _logger = logger;
        _myFinanceDbContext = myFinanceDbContext;
    }

    public IActionResult Index()
    {
        var teste = _myFinanceDbContext.PlanoConta.FirstOrDefault();
        ViewBag.TESTE = teste.Nome;

        return View();
    }

    public IActionResult Privacy()
    {
        return View();
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}

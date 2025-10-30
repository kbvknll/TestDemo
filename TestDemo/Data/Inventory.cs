using System;
using System.Collections.Generic;

namespace TestDemo.Data;

public partial class Inventory
{
    public int Id { get; set; }

    public string? Name { get; set; }

    public int? IdCategory { get; set; }

    public int? IdSostoyanie { get; set; }

    public decimal? BasePrice { get; set; }

    public string? Image { get; set; }

    public string? Description { get; set; }

    public int? IdStatus { get; set; }

    public int? IdSklad { get; set; }

    public virtual ICollection<EmployeeInventory> EmployeeInventories { get; set; } = new List<EmployeeInventory>();

    public virtual Category? IdCategoryNavigation { get; set; }

    public virtual Sklad? IdSkladNavigation { get; set; }

    public virtual Sostoyanie? IdSostoyanieNavigation { get; set; }

    public virtual Status? IdStatusNavigation { get; set; }

    public virtual ICollection<Rental> Rentals { get; set; } = new List<Rental>();
}

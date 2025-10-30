using System;
using System.Collections.Generic;

namespace TestDemo.Data;

public partial class Proverka
{
    public int Id { get; set; }

    public string? Name { get; set; }

    public virtual ICollection<Rental> Rentals { get; set; } = new List<Rental>();
}

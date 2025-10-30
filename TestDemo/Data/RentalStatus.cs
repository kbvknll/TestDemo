using System;
using System.Collections.Generic;

namespace TestDemo.Data;

public partial class RentalStatus
{
    public int Id { get; set; }

    public virtual ICollection<Rental> Rentals { get; set; } = new List<Rental>();
}

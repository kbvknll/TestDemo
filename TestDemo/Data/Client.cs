using System;
using System.Collections.Generic;

namespace TestDemo.Data;

public partial class Client
{
    public int Id { get; set; }

    public string? Username { get; set; }

    public string? Password { get; set; }

    public string? FirstName { get; set; }

    public string? LastName { get; set; }

    public string? Patronymic { get; set; }

    public string? CompanyName { get; set; }

    public int? Inn { get; set; }

    public string? Phone { get; set; }

    public virtual ICollection<Rental> Rentals { get; set; } = new List<Rental>();
}

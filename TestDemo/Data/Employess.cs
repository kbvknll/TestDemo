using System;
using System.Collections.Generic;

namespace TestDemo.Data;

public partial class Employess
{
    public int Id { get; set; }

    public string? Username { get; set; }

    public string? Password { get; set; }

    public int? IdRole { get; set; }

    public string? FirstName { get; set; }

    public string? LastName { get; set; }

    public string? Patronymic { get; set; }

    public string? Phone { get; set; }

    public int? PassportSeriya { get; set; }

    public int? PassportNumber { get; set; }

    public virtual ICollection<EmployeeInventory> EmployeeInventories { get; set; } = new List<EmployeeInventory>();

    public virtual Role? IdRoleNavigation { get; set; }
}

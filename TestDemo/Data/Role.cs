using System;
using System.Collections.Generic;

namespace TestDemo.Data;

public partial class Role
{
    public int Id { get; set; }

    public string? Name { get; set; }

    public virtual ICollection<Employess> Employesses { get; set; } = new List<Employess>();
}

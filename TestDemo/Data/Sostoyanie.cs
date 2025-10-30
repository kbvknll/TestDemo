using System;
using System.Collections.Generic;

namespace TestDemo.Data;

public partial class Sostoyanie
{
    public int Id { get; set; }

    public string? Name { get; set; }

    public virtual ICollection<Inventory> Inventories { get; set; } = new List<Inventory>();
    public override string ToString()
    {
        return Name ?? string.Empty;
    }
}

using System;
using System.Collections.Generic;

namespace TestDemo.Data;

public partial class EmployeeInventory
{
    public int Id { get; set; }

    public int? IdEmployee { get; set; }

    public int? IdInventory { get; set; }

    public virtual Employess? IdEmployeeNavigation { get; set; }

    public virtual Inventory? IdInventoryNavigation { get; set; }
}

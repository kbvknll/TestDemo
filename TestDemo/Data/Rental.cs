using System;
using System.Collections.Generic;

namespace TestDemo.Data;

public partial class Rental
{
    public int Id { get; set; }

    public int? IdUser { get; set; }

    public int? IdInventory { get; set; }

    public DateOnly? StartDate { get; set; }

    public DateOnly? EndDate { get; set; }

    public decimal? FinalPrice { get; set; }

    public int? IdRentalStatus { get; set; }

    public int? IdProverka { get; set; }

    public virtual Inventory? IdInventoryNavigation { get; set; }

    public virtual Proverka? IdProverkaNavigation { get; set; }

    public virtual RentalStatus? IdRentalStatusNavigation { get; set; }

    public virtual Client? IdUserNavigation { get; set; }
}

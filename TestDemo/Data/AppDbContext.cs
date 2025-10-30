using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace TestDemo.Data;

public partial class AppDbContext : DbContext
{
    public AppDbContext()
    {
    }

    public AppDbContext(DbContextOptions<AppDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Category> Categories { get; set; }

    public virtual DbSet<Client> Clients { get; set; }

    public virtual DbSet<EmployeeInventory> EmployeeInventories { get; set; }

    public virtual DbSet<Employess> Employesses { get; set; }

    public virtual DbSet<Inventory> Inventories { get; set; }

    public virtual DbSet<Proverka> Proverkas { get; set; }

    public virtual DbSet<Rental> Rentals { get; set; }

    public virtual DbSet<RentalStatus> RentalStatuses { get; set; }

    public virtual DbSet<Role> Roles { get; set; }

    public virtual DbSet<Sklad> Sklads { get; set; }

    public virtual DbSet<Sostoyanie> Sostoyanies { get; set; }

    public virtual DbSet<Status> Statuses { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseNpgsql("Host=localhost;Port=5432;Database=DemoDb;Username=postgres;Password=2006");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Category>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("Categories_pkey");

            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("id");
            entity.Property(e => e.Name).HasColumnName("name");
        });

        modelBuilder.Entity<Client>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("clients_pkey");

            entity.ToTable("clients");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.CompanyName).HasColumnName("company_name");
            entity.Property(e => e.FirstName).HasColumnName("firstName");
            entity.Property(e => e.Inn).HasColumnName("inn");
            entity.Property(e => e.LastName).HasColumnName("lastName");
            entity.Property(e => e.Password).HasColumnName("password");
            entity.Property(e => e.Patronymic).HasColumnName("patronymic");
            entity.Property(e => e.Phone)
                .HasMaxLength(11)
                .IsFixedLength()
                .HasColumnName("phone");
            entity.Property(e => e.Username).HasColumnName("username");
        });

        modelBuilder.Entity<EmployeeInventory>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("employee_inventory_pkey");

            entity.ToTable("employee_inventory");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.IdEmployee).HasColumnName("id_employee");
            entity.Property(e => e.IdInventory).HasColumnName("id_inventory");

            entity.HasOne(d => d.IdEmployeeNavigation).WithMany(p => p.EmployeeInventories)
                .HasForeignKey(d => d.IdEmployee)
                .HasConstraintName("employee_inventory_id_employee_fkey");

            entity.HasOne(d => d.IdInventoryNavigation).WithMany(p => p.EmployeeInventories)
                .HasForeignKey(d => d.IdInventory)
                .HasConstraintName("employee_inventory_id_inventory_fkey");
        });

        modelBuilder.Entity<Employess>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("employess_pkey");

            entity.ToTable("employess");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.FirstName).HasColumnName("firstName");
            entity.Property(e => e.IdRole).HasColumnName("id_role");
            entity.Property(e => e.LastName).HasColumnName("lastName");
            entity.Property(e => e.PassportNumber).HasColumnName("passport_number");
            entity.Property(e => e.PassportSeriya).HasColumnName("passport_seriya");
            entity.Property(e => e.Password).HasColumnName("password");
            entity.Property(e => e.Patronymic).HasColumnName("patronymic");
            entity.Property(e => e.Phone)
                .HasMaxLength(11)
                .IsFixedLength()
                .HasColumnName("phone");
            entity.Property(e => e.Username).HasColumnName("username");

            entity.HasOne(d => d.IdRoleNavigation).WithMany(p => p.Employesses)
                .HasForeignKey(d => d.IdRole)
                .HasConstraintName("employess_id_role_fkey");
        });

        modelBuilder.Entity<Inventory>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("inventories_pkey");

            entity.ToTable("inventories");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.BasePrice)
                .HasPrecision(10, 2)
                .HasColumnName("base_price");
            entity.Property(e => e.Description).HasColumnName("description");
            entity.Property(e => e.IdCategory).HasColumnName("id_category");
            entity.Property(e => e.IdSklad).HasColumnName("id_sklad");
            entity.Property(e => e.IdSostoyanie).HasColumnName("id_sostoyanie");
            entity.Property(e => e.IdStatus).HasColumnName("id_status");
            entity.Property(e => e.Image).HasColumnName("image");
            entity.Property(e => e.Name).HasColumnName("name");

            entity.HasOne(d => d.IdCategoryNavigation).WithMany(p => p.Inventories)
                .HasForeignKey(d => d.IdCategory)
                .HasConstraintName("inventories_id_category_fkey");

            entity.HasOne(d => d.IdSkladNavigation).WithMany(p => p.Inventories)
                .HasForeignKey(d => d.IdSklad)
                .HasConstraintName("inventories_id_sklad_fkey");

            entity.HasOne(d => d.IdSostoyanieNavigation).WithMany(p => p.Inventories)
                .HasForeignKey(d => d.IdSostoyanie)
                .HasConstraintName("inventories_id_sostoyanie_fkey");

            entity.HasOne(d => d.IdStatusNavigation).WithMany(p => p.Inventories)
                .HasForeignKey(d => d.IdStatus)
                .HasConstraintName("inventories_id_status_fkey");
        });

        modelBuilder.Entity<Proverka>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("proverka_pkey");

            entity.ToTable("proverka");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Name).HasColumnName("name");
        });

        modelBuilder.Entity<Rental>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("rentals_pkey");

            entity.ToTable("rentals");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.EndDate).HasColumnName("end_date");
            entity.Property(e => e.FinalPrice)
                .HasPrecision(10, 2)
                .HasColumnName("final_price");
            entity.Property(e => e.IdInventory).HasColumnName("id_inventory");
            entity.Property(e => e.IdProverka).HasColumnName("id_proverka");
            entity.Property(e => e.IdRentalStatus).HasColumnName("id_rental_status");
            entity.Property(e => e.IdUser).HasColumnName("id_user");
            entity.Property(e => e.StartDate).HasColumnName("start_date");

            entity.HasOne(d => d.IdInventoryNavigation).WithMany(p => p.Rentals)
                .HasForeignKey(d => d.IdInventory)
                .HasConstraintName("rentals_id_inventory_fkey");

            entity.HasOne(d => d.IdProverkaNavigation).WithMany(p => p.Rentals)
                .HasForeignKey(d => d.IdProverka)
                .HasConstraintName("rentals_id_proverka_fkey");

            entity.HasOne(d => d.IdRentalStatusNavigation).WithMany(p => p.Rentals)
                .HasForeignKey(d => d.IdRentalStatus)
                .HasConstraintName("rentals_id_rental_status_fkey");

            entity.HasOne(d => d.IdUserNavigation).WithMany(p => p.Rentals)
                .HasForeignKey(d => d.IdUser)
                .HasConstraintName("rentals_id_user_fkey");
        });

        modelBuilder.Entity<RentalStatus>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("rental_statuses_pkey");

            entity.ToTable("rental_statuses");

            entity.Property(e => e.Id).HasColumnName("id");
        });

        modelBuilder.Entity<Role>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("roles_pkey");

            entity.ToTable("roles");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Name).HasColumnName("name");
        });

        modelBuilder.Entity<Sklad>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("sklad_pkey");

            entity.ToTable("sklad");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Name).HasColumnName("name");
        });

        modelBuilder.Entity<Sostoyanie>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("sostoyanie_pkey");

            entity.ToTable("sostoyanie");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Name).HasColumnName("name");
        });

        modelBuilder.Entity<Status>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("statuses_pkey");

            entity.ToTable("statuses");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Name).HasColumnName("name");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}

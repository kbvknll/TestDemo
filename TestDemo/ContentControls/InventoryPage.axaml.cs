using Avalonia;
using Avalonia.Controls;
using Avalonia.Markup.Xaml;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using System.Linq;
using System.Threading.Tasks;
using TestDemo.Data;
using TestDemo.Helpers;

namespace TestDemo;

public partial class InventoryPage : UserControl
{
    public InventoryPage()
    {
        InitializeComponent();
        UpdateDataGrid();
    }

    private void UpdateDataGrid()
    {
        var inventory = App.dbContext.Inventories
            .Include(inventory => inventory.IdCategoryNavigation)
            .Include(inventory => inventory.IdSostoyanieNavigation)
            .Include(inventory => inventory.IdStatusNavigation)
            .Include(inventory => inventory.IdSkladNavigation)
            .ToList()
            .OrderBy(x => x.Id);
        DataGridInventory.ItemsSource = inventory;
    }

    private async void AddButton_Click(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
    {
        var parent = this.VisualRoot as Window;
        var add = new AddEditInventory();
        await add.ShowDialog(parent);

        UpdateDataGrid();
    }

    private async void EditButton_Click_1(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
    {
        var selectedInventory = DataGridInventory.SelectedItem as Inventory;
        if (selectedInventory == null)
        {
            await MessageBoxHelper.ShowMessage("Ошибка", "Выберите инвентарь для редактирования");
            return;
        }

        var editor = new AddEditInventory(selectedInventory);
        await editor.ShowDialog(this.VisualRoot as Window);
        UpdateDataGrid();
    }
}
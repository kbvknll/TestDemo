using Avalonia;
using Avalonia.Controls;
using Avalonia.Markup.Xaml;
using System.Linq;

namespace TestDemo;

public partial class CategoryPage : UserControl
{
    public CategoryPage()
    {
        InitializeComponent();
        UpdateDataGrid();
    }

    private void UpdateDataGrid()
    {
        DataGridCategory.ItemsSource = App.dbContext.Categories.ToList().OrderBy(x => x.Id);
    }

}
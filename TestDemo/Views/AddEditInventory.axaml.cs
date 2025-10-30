using Avalonia;
using Avalonia.Controls;
using Avalonia.Markup.Xaml;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using TestDemo.Data;
using TestDemo.Helpers;

namespace TestDemo;

public partial class AddEditInventory : Window
{
    private Inventory? _inventory;
    public AddEditInventory()
    {
        InitializeComponent();
        LoadComboboxData();
    }

    public AddEditInventory(Inventory inventory) : this ()
    {
        //InitializeComponent();
        _inventory = inventory;
        LoadInventoryData();

        //if (_inventory != null)
        //{
        //    tbName.Text = _inventory.Name;
        //    tbPrice.Text = _inventory.BasePrice.ToString();
        //    tbDescription.Text = _inventory.Description;

        //    cbCategory.SelectedValue = _inventory.IdCategory;
        //    cbSklad.SelectedValue = _inventory.IdSklad;
        //    cbSostoyanie.SelectedValue = _inventory.IdSostoyanie;
        //    cbStatus.SelectedValue = _inventory.IdStatus;
        //}
    }

    private void LoadInventoryData()
    {
        if (_inventory != null)
        {
            tbName.Text = _inventory.Name;
            tbPrice.Text = _inventory.BasePrice.ToString();
            tbDescription.Text = _inventory.Description;

            if (_inventory.IdCategoryNavigation != null)
            {
                var category = _inventory.IdCategoryNavigation;
                cbCategory.SelectedValue = category.Id;
            }

            if (_inventory.IdSkladNavigation != null)
            {
                var sklad = _inventory.IdSkladNavigation;
                cbSklad.SelectedValue= sklad.Id;

            }

            if (_inventory.IdSostoyanieNavigation != null)
            {
                var sost = _inventory.IdSostoyanieNavigation;
                cbSostoyanie.SelectedValue= sost.Id;
            }

            if (_inventory.IdStatusNavigation != null)
            {
                var status = _inventory.IdStatusNavigation;
                cbStatus.SelectedValue = status.Id;
            }
        }
    }

    private async void SaveButton_Click(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
    {
        if (string.IsNullOrWhiteSpace(tbName.Text) || string.IsNullOrWhiteSpace(tbPrice.Text) ||
                string.IsNullOrWhiteSpace(tbDescription.Text) || cbCategory.SelectedItem == null ||
                cbSklad.SelectedItem == null || cbSostoyanie.SelectedItem == null || cbStatus.SelectedItem == null)
        {
            await MessageBoxHelper.ShowMessage("Ошибка", "Заполните все обязательные поля", this);
            return;
        }

        if (cbCategory.SelectedItem == null)
        {
            await MessageBoxHelper.ShowMessage("Ошибка", "Выберите категорию", this);
            return;
        }

        if (cbSklad.SelectedItem == null)
        {
            await MessageBoxHelper.ShowMessage("Ошибка", "Выберите склад", this);
            return;
        }

        if (cbSostoyanie.SelectedItem == null)
        {
            await MessageBoxHelper.ShowMessage("Ошибка", "Выберите состояние инвентаря", this);
            return;
        }

        if (cbStatus.SelectedItem == null)
        {
            await MessageBoxHelper.ShowMessage("Ошибка", "Выберите статус инвентаря", this);
            return;
        }

        if (!decimal.TryParse(tbPrice.Text, out decimal basePrice) || basePrice < 0)
        {
            await MessageBoxHelper.ShowMessage("Ошибка", "Введите корректную стоимость", this);
            return;
        }

        var selectedCategory = cbCategory.SelectedItem as Category;
        var selectedSklad = cbCategory.SelectedItem as Sklad;
        var selectedSostoyanie = cbSostoyanie.SelectedItem as Sostoyanie;
        var selectedStatus = cbStatus.SelectedItem as Status;

        var cb1Category = (Category)cbCategory.SelectedItem;
        var cb1Skladyy = (Sklad)cbSklad.SelectedItem;
        var cb1Sostoyanie = (Sostoyanie)cbSostoyanie.SelectedItem;
        var cb1Status = (Status)cbStatus.SelectedItem;

        var name = tbName.Text;
        decimal price = decimal.Parse(tbPrice.Text);
        var description = tbDescription.Text;

        if (_inventory == null)
        {
            var newInventory = new Inventory()
            {
                IdCategory = selectedCategory.Id,
                IdSklad = selectedSklad?.Id,
                IdSostoyanie = selectedSostoyanie.Id,
                IdStatus = selectedStatus.Id,
                Name = name,
                BasePrice = price,
                Description = description
            };
            App.dbContext.Inventories.Add(newInventory);
        }
        else
        {
            _inventory.IdCategory = selectedCategory?.Id ?? _inventory.IdCategory;
            _inventory.IdSklad = selectedSklad?.Id ?? _inventory.IdSklad;
            _inventory.IdSostoyanie = selectedSostoyanie?.Id ?? _inventory.IdSostoyanie;
            _inventory.IdStatus = selectedStatus?.Id ?? _inventory.IdStatus;
            _inventory.Name = name;
            _inventory.BasePrice = price;
            _inventory.Description = description;
            
            if(_inventory.IdCategoryNavigation != null)
            {
                var category = _inventory.IdCategoryNavigation;
                category.Id = cb1Category.Id;

                App.dbContext.Categories.Update(category);

            }

            if (_inventory.IdSkladNavigation != null)
            {
                var sklad = _inventory.IdSkladNavigation;
                sklad.Id = cb1Skladyy.Id;

                App.dbContext.Sklads.Update(sklad);
            }

            if (_inventory.IdSostoyanieNavigation != null)
            {
                var sost = _inventory.IdSostoyanieNavigation;
                sost.Id = cb1Sostoyanie.Id;

                App.dbContext.Sostoyanies.Update(sost); 
            }

            if (_inventory.IdStatusNavigation != null)
            {
                var status = _inventory.IdStatusNavigation;
                status.Id = cb1Status.Id;

                App.dbContext.Statuses.Update(status);
            }

            App.dbContext.Inventories.Update(_inventory);
        }
        App.dbContext.SaveChanges();
        await MessageBoxHelper.ShowMessage("Успешно", "Данные сохранены!", this);
        this.Close();

    }

    private void LoadComboboxData()
    {
        var categories = App.dbContext.Categories.ToList();
        cbCategory.ItemsSource = categories;

        var sklad = App.dbContext.Sklads.ToList();
        cbSklad.ItemsSource = sklad;

        var sostoyanie = App.dbContext.Sostoyanies.ToList();
        cbSostoyanie.ItemsSource = sostoyanie;

        var status = App.dbContext.Statuses.ToList();
        cbStatus.ItemsSource = status;
    }

    private void LoadData()
    {
        var categories = App.dbContext.Categories
                .ToList();
        cbCategory.ItemsSource = categories;
    }
}
using Avalonia.Controls;
using Avalonia.Layout;
using Avalonia.Media;
using Avalonia;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TestDemo.Helpers
{
    public static class MessageBoxHelper
    {
        public static async Task ShowMessage(string title, string message, Window? owner = null)
        {
            var dialog = new Window
            {
                Title = title,
                Width = 400,
                Height = 200,
                WindowStartupLocation = WindowStartupLocation.CenterOwner
            };

            var stackPanel = new StackPanel();
            stackPanel.Children.Add(new TextBlock
            {
                Text = message,
                Margin = new Thickness(20),
                TextWrapping = TextWrapping.Wrap
            });

            var okButton = new Button
            {
                Content = "OK",
                HorizontalAlignment = HorizontalAlignment.Center,
                Margin = new Thickness(10),
                Width = 100
            };
            okButton.Click += (s, e) => dialog.Close();
            stackPanel.Children.Add(okButton);

            dialog.Content = stackPanel;

            if (owner != null)
                await dialog.ShowDialog(owner);
            else
                dialog.Show();
        }

        public static async Task<bool> ShowConfirmation(string title, string message, Window? owner = null)
        {
            var result = false;
            var dialog = new Window
            {
                Title = title,
                Width = 350,
                Height = 180,
                WindowStartupLocation = WindowStartupLocation.CenterOwner
            };

            var stackPanel = new StackPanel();
            stackPanel.Children.Add(new TextBlock
            {
                Text = message,
                Margin = new Thickness(20),
                TextWrapping = TextWrapping.Wrap
            });

            var buttonsPanel = new StackPanel
            {
                Orientation = Orientation.Horizontal,
                HorizontalAlignment = HorizontalAlignment.Center,
                Spacing = 10,
                Margin = new Thickness(0, 10, 0, 0)
            };

            var yesButton = new Button
            {
                Content = "Да",
                Width = 80
            };
            yesButton.Classes.Add("Danger");
            yesButton.Click += (s, e) => { result = true; dialog.Close(); };

            var noButton = new Button
            {
                Content = "Нет",
                Width = 80
            };
            noButton.Classes.Add("Secondary");
            noButton.Click += (s, e) => { result = false; dialog.Close(); };

            buttonsPanel.Children.Add(yesButton);
            buttonsPanel.Children.Add(noButton);
            stackPanel.Children.Add(buttonsPanel);

            dialog.Content = stackPanel;

            if (owner != null)
                await dialog.ShowDialog(owner);
            else
                dialog.Show();

            return result;
        }
    }
}

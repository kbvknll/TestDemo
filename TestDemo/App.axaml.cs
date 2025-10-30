using System.Linq;
using Avalonia;
using Avalonia.Controls.ApplicationLifetimes;
using Avalonia.Data.Core;
using Avalonia.Data.Core.Plugins;
using Avalonia.Markup.Xaml;
using TestDemo.Data;
using TestDemo.Views;

namespace TestDemo
{
    public partial class App : Application
    {
        public static AppDbContext dbContext { get; set; } = new AppDbContext();
        public override void Initialize()
        {
            AvaloniaXamlLoader.Load(this);
        }

        public override void OnFrameworkInitializationCompleted()
        {
            if (ApplicationLifetime is IClassicDesktopStyleApplicationLifetime desktop)
            {
                desktop.MainWindow = new MainWindow();

            }

            base.OnFrameworkInitializationCompleted();
        }

       
    }
}
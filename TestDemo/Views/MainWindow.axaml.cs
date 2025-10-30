using Avalonia.Controls;

namespace TestDemo.Views
{
    public partial class MainWindow : Window
    {

        public MainWindow()
        {
            InitializeComponent();
            MainControl.Content = new MainContentControl();
        }
    }
}
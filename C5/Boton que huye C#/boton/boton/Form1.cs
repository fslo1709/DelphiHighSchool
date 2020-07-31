using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace boton
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_MouseEnter(object sender, EventArgs e)
        {
            Random xrand = new Random();
            Random yrand = new Random();
            int a = this.Width - button1.Width;
            int b = this.Height - button1.Height;
            int posx = xrand.Next(0, a);
            int posy = yrand.Next(0, b);
            button1.Top = posy;
            button1.Left = posx;
        }
    }
}

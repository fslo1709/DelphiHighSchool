using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace hoja
{
    public partial class Form1 : Form
    {
        Int32 c = 0;
        System.Drawing.Pen lapiz = new System.Drawing.Pen(System.Drawing.Color.Black);
        Graphics t;
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Click(object sender, EventArgs e)
        {
            c = 0;
            t = this.CreateGraphics();
            do
            {
                Point p1 = new Point(c, 0);
                Point p2 = new Point(this.ClientSize.Width, c);
                c += 10;
                t.DrawLine(lapiz, p1, p2);
            }
            while (c < this.ClientSize.Height);
            c = 0;
            do
            {
                Point p1 = new Point(0, c);
                Point p2 = new Point(c, this.ClientSize.Height);
                c += 10;
                t.DrawLine(lapiz, p1, p2);
            }
            while (c < this.ClientSize.Height);
        }

        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            lapiz.Dispose();
            t.Dispose();
        }
    }
}

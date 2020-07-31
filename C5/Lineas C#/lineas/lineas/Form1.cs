using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace lineas
{
    public partial class Form1 : Form
    {
        Point p1 = new Point(0, 0);
        Point p2 = new Point(400, 400);
        System.Drawing.Pen lapiz = new System.Drawing.Pen(System.Drawing.Color.Black);
        Graphics t;
        public Form1()
        {
            InitializeComponent();
            this.ClientSize = new Size(400, 400);
        }

        private void Form1_Click(object sender, EventArgs e)
        {
            t = this.CreateGraphics();
            t.DrawLine(lapiz, p1, p2);
        }

        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            lapiz.Dispose();
            t.Dispose();
        }
    }
}
  
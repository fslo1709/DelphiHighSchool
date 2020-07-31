using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace figuras
{
    public partial class Form1 : Form
    {
        Point pt1 = new Point(0, 0);
        Point pt2 = new Point(0, 0);
        Point pt3 = new Point(0, 0);
        Point pt4 = new Point(0, 0);
        System.Drawing.Pen lapiz = new System.Drawing.Pen(System.Drawing.Color.Black);
        Graphics t;

        public Form1()
        {
            InitializeComponent();
            this.ClientSize = new Size(700, 700);
            pt3 = pt3 + new Size(this.ClientSize.Width/2,0);
            pt4 = pt4 + new Size(this.ClientSize.Width / 2, this.ClientSize.Height / 2);
        }
        
        public void cuad(int dx, int dy)
        {
            pt1 = pt3 + new Size(0, dy);
            pt2 = pt4 + new Size(dx, 0);
            t.DrawLine(lapiz, pt1, pt2);
        }

        private void Form1_Click(object sender, EventArgs e)
        {
            
            t = this.CreateGraphics();
            Int32 vara = 0;
            do
            {
                cuad(vara, vara);
                cuad(-vara, vara);
                cuad(-vara, this.ClientSize.Height-vara);
                cuad(vara, this.ClientSize.Height-vara);
                vara += 10;
            }
            while (vara < this.ClientSize.Width/2);
        }

        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            lapiz.Dispose();
            t.Dispose();
        }
    }
}

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace Hanoi
{
    public partial class Form1 : Form
    {
        TextBox[] discos = new TextBox[10];
        Int32 max;
        public void hanoi(int n, torre to1, torre to2, torre to3, Form f)
        {
            if (n == 1)
            {
                to1.pop(discos[to1.vec[to1.sp]],to3,to1.vec[to1.sp], f);
            }
            else
            {
                hanoi(n - 1, to1, to3, to2, f);
                hanoi(1, to1, to2, to3, f);
                hanoi(n - 1, to2, to1, to3, f);
            }
        }
        public class torre
        {
            public
                Int32 sp;
            public
                Int32[] vec = new Int32[10];
            public
                Int32 posx;
            private
                Button[] bot = new Button[2];
            public
                torre(int x, Form f)
                {
                    int i = 0;
                    sp = -1;
                    posx = x;
                    for (i = 0; i < 10; i++)
                    {
                        vec[i] = -1;
                    }
                    bot[0] = new Button();
                    bot[0].Location = new Point(x+70,70);
                    bot[0].Size = new Size(10, 230);
                    bot[0].Parent = f;
                    bot[0].BackColor = Color.White;
                    bot[0].Enabled = false;
                    bot[1] = new Button();
                    bot[1].Location = new Point(x, 300);
                    bot[1].Size = new Size(150, 20);
                    bot[1].Parent = f;
                    bot[1].BackColor = Color.White;
                    bot[1].Enabled = false;
                }
            public void push(TextBox a, int m, Form f)
                {
                    sp++;
                    vec[sp] = m;
                    while (a.Location.Y < 280-sp*20)
                    {
                        a.Refresh();
                        f.Refresh();
                        a.Location = new Point(a.Location.X, a.Location.Y + 10);
                        System.Threading.Thread.Sleep(25);
                    }
                }
            public void pop(TextBox a, torre tor, int m, Form f)
                {
                    int t = vec[sp];
                    vec[sp] = 0;
                    sp--;
                    while (a.Location.Y > 50)
                    {
                        a.Refresh();
                        f.Refresh();
                        a.Location = new Point(a.Location.X, a.Location.Y - 10);
                        System.Threading.Thread.Sleep(25);
                    }
                    if (a.Location.X > tor.posx)
                    {
                        while (a.Location.X > tor.posx + t*5)
                        {
                            a.Refresh();
                            f.Refresh();
                            a.Location = new Point(a.Location.X - 10, a.Location.Y);
                            System.Threading.Thread.Sleep(25);
                        }
                    }
                    else
                    {
                        while (a.Location.X < tor.posx + t*5)
                        {
                            a.Refresh();
                            f.Refresh();
                            a.Location = new Point(a.Location.X + 10, a.Location.Y);
                            System.Threading.Thread.Sleep(25);
                        }
                    }
                    tor.push(a, m, f);
                }
        }
        public Form1()
        {
            InitializeComponent();
        }
        private void button1_Click(object sender, EventArgs e)
        {
            max = Decimal.ToInt32(numericUpDown1.Value);
            int j = 0;
            var t1 = new torre(20,this);
            var t2 = new torre(190,this);
            var t3 = new torre(360,this);
            while (j < max)
            {
                discos[j] = new TextBox();
                discos[j].Location = new Point(20 + j * 5, 50);
                discos[j].Size = new Size(150 - j * 10, 20);
                discos[j].Parent = this;
                discos[j].Enabled = false;
                discos[j].BackColor = Color.Gold;
                discos[j].BringToFront();
                discos[j].Refresh();
                j++;
            }
            button1.Visible = false;
            numericUpDown1.Visible = false;
            for (j = 0; j < max; j++)
            {
                t1.push(discos[j], j, this);
            }
            hanoi(max, t1, t2, t3, this);
        }
    }
}
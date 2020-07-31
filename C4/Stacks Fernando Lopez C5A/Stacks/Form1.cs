using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace Stacks
{
    
    
    
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }


        private void Form1_MouseDown(object sender, MouseEventArgs e)
        {
            new tstack(e.X, e.Y, this);
        }
    }

    public class tstack
    {
        private
        TextBox[] v = new TextBox[5];
        Button bpush;
        Button bpop;
        Label flecha;
        Int32 sp;

        public tstack(int x, int y, Form f)
        {
            int i;
            sp = 0;
            for (i = 0; i < 5; i++)
            {
                v[i] = new TextBox();
                v[i].Location = new Point(x, y + 100 - (i * 25));
                v[i].Size = new Size(150, 25);
                v[i].Parent = f;
            }
            bpush = new Button();
            bpush.Text = "Push";
            bpush.Location = new Point(x, y + 120);
            bpush.Size = new Size(75, 25);
            bpush.Click += new System.EventHandler(bpush_meow);
            bpush.Parent = f;
            bpop = new Button();
            bpop.Text = "Pop";
            bpop.Location = new Point(x + 75, y + 120);
            bpop.Size = new Size(75, 25);
            bpop.Click += new System.EventHandler(bpop_meow);
            bpop.Parent = f;
            flecha = new Label();
            flecha.Text = "<-";
            flecha.Size = new Size(30,15);
            flecha.Location = new Point(x+150,y+125);
            flecha.Parent = f;
        }

        private void bpush_meow(object sender, EventArgs e)
        {
            if (sp < 5)
            {
                Random rnd = new Random();
                int r = rnd.Next(1, 100);
                v[sp].Text = Convert.ToString(r);
                sp++;
                flecha.Top = flecha.Top - 25; 
            }
            else MessageBox.Show("Stack Overflow");
        }

        private void bpop_meow(object sender, EventArgs e)
        {
            if (sp > 0)
            {
                sp--;
                v[sp].Text = "";
                flecha.Top = flecha.Top + 25;
            }
            else MessageBox.Show("Stack Underflow");
        }
    }

}

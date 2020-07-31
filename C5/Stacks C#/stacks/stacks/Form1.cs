using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace stacks
{
    public class tstack
    {
        private
            TextBox[] v = new TextBox[5];
            Button bpush, bpop;
            Label flechita;
            int sp; 
        public
            tstack(int x, int y, Form f)
            {
                int i;
                for (i = 0; i < 5; i++)
                {
                    v[i] = new TextBox();
                    v[i].Location = new Point(x, y + 100 - i * 20);
                    v[i].Size = new Size(50, 20);
                    v[i].Parent = f;
                }
                bpush = new Button();
                bpush.Location = new Point(x, y + 120);
                bpush.Size = new Size(25, 20);
                bpush.Parent = f;
                bpop = new Button();
                bpop.Location = new Point(x + 25, y + 120);
                bpop.Size = new Size(25, 20);
                bpop.Parent = f;
                flechita = new Label();
                flechita.Location = new Point(x + 50, y + 100);
                flechita.Size = new Size(50, 20);
                flechita.Text = "<-";
                flechita.Parent = f;
            }
        }
    public partial class Form1 : Form
    {
        
        public Form1()
        {
            InitializeComponent();
            var meow = new tstack(20,20,this);
        }
    }
}

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace Evaluador
{
    public partial class Form1 : Form
    {
        int p = 0;
        bool fallo = false;
        public bool evaluar(string exp)
        {
            bool t = false;
            if (p < exp.Length)
            {
                switch (exp[p])
                {
                    case 'V':
                        t = true;
                        p++;
                        break;
                    case 'F':
                        t = false;
                        p++;
                        break;
                    case '!':
                        p++;
                        t = !(evaluar(exp));
                        break;
                    case '&':
                        p++;
                        t = (evaluar(exp))&&(evaluar(exp));
                        break;
                    case '|':
                        p++;
                        t = (evaluar(exp))||(evaluar(exp));
                        break;
                }
                return t;
            }
            else
            {
                fallo = true;
                return false;
            }
        }
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            bool x = false;
            string m = textBox1.Text;
            int a = m.Length;
            p = 0;
            x = evaluar(m);
            if (fallo == false)
            {
                if (x == true)
                {
                    label1.Text = "V";
                }
                else
                {
                    label1.Text = "F";
                }
            }
            else
            {
                label1.Text="Error";
            }
        }
    }
}

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace Sorts
{
    public partial class Form1 : Form
    {
        Random rand = new Random();
        int[] numeros = new int[1000];
        int t;
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            textBox1.Text = String.Empty;
            for (int i = 0; i <= 999; i++)
            {
                numeros[i] = rand.Next(0,2000);
                textBox1.AppendText(Environment.NewLine + Convert.ToString(numeros[i]));
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            textBox1.Text = string.Empty;
            int[] ordenados = new int[1000];
            ordenados = numeros;
            for (int i = 0; i <= 999; i++)
            {
                for (int j = i+1; j <= 999; j++)
                {
                    if (ordenados[i] > ordenados[j])
                    {
                        t = ordenados[i];
                        ordenados[i] = ordenados[j];
                        ordenados[j] = t;
                    }
                }
            }
            for (int i = 0; i <= 999; i++)
            {
                textBox1.AppendText(Environment.NewLine + Convert.ToString(ordenados[i]));
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            textBox1.Text = String.Empty;
            int[] ordenados = new int[1000];
            for (int i = 0; i <= 999; i++)
            {
                t = 0;
                for (int j = 0; j <= 999; j++)
                {
                    if (numeros[i] > numeros[j])
                        t++;
                }
                ordenados[t] = numeros[i];     
            }
            for (int i = 1; i <= 999; i++)
            {
                if (ordenados[i] == 0)
                    ordenados[i] = ordenados[i - 1];
                textBox1.AppendText(Environment.NewLine + Convert.ToString(ordenados[i]));
            }
        }
    }
}

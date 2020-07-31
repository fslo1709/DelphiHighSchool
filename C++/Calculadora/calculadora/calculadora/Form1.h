#pragma once
#include "math.h"
namespace calculadora {

	using namespace System;
	using namespace System::ComponentModel;
	using namespace System::Collections;
	using namespace System::Windows::Forms;
	using namespace System::Data;
	using namespace System::Drawing;

	bool p,resta=false;
	double a,b=0;
	int op=0;
	const double pi  =3.141592653589793238463;
	
	/// <summary>
	/// Summary for Form1
	/// </summary>
	public ref class Form1 : public System::Windows::Forms::Form
	{
	public:
		Form1(void)
		{
			InitializeComponent();
			//
			//TODO: Add the constructor code here
			//
		}
	protected:
		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		~Form1()
		{
			if (components)
			{
				delete components;
			}
		}
	private: System::Windows::Forms::Button^  button1;
	private: System::Windows::Forms::Button^  button2;
	private: System::Windows::Forms::Button^  button3;
	private: System::Windows::Forms::Button^  button4;
	private: System::Windows::Forms::Button^  button5;
	private: System::Windows::Forms::Button^  button6;
	private: System::Windows::Forms::Button^  button7;
	private: System::Windows::Forms::Button^  button8;
	private: System::Windows::Forms::Button^  button9;
	private: System::Windows::Forms::Button^  button10;
	private: System::Windows::Forms::Button^  button11;
	private: System::Windows::Forms::TextBox^  textBox1;
	private: System::Windows::Forms::Button^  button12;
	private: System::Windows::Forms::Button^  button13;
	private: System::Windows::Forms::Button^  button14;
	private: System::Windows::Forms::Button^  button15;
	private: System::Windows::Forms::Button^  button16;
	private: System::Windows::Forms::Button^  button17;
	private: System::Windows::Forms::Button^  button18;
	private: System::Windows::Forms::Button^  button19;
	private: System::Windows::Forms::Button^  button20;
	private: System::Windows::Forms::Button^  button21;
	private: System::Windows::Forms::Button^  button22;
	private: System::Windows::Forms::Button^  button23;
	private: System::Windows::Forms::Button^  button24;
	private: System::Windows::Forms::Button^  button25;
	private: System::Windows::Forms::Button^  button26;
	protected: 

	private:
		/// <summary>
		/// Required designer variable.
		/// </summary>
		System::ComponentModel::Container ^components;

#pragma region Windows Form Designer generated code
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		void InitializeComponent(void)
		{
			this->button1 = (gcnew System::Windows::Forms::Button());
			this->button2 = (gcnew System::Windows::Forms::Button());
			this->button3 = (gcnew System::Windows::Forms::Button());
			this->button4 = (gcnew System::Windows::Forms::Button());
			this->button5 = (gcnew System::Windows::Forms::Button());
			this->button6 = (gcnew System::Windows::Forms::Button());
			this->button7 = (gcnew System::Windows::Forms::Button());
			this->button8 = (gcnew System::Windows::Forms::Button());
			this->button9 = (gcnew System::Windows::Forms::Button());
			this->button10 = (gcnew System::Windows::Forms::Button());
			this->button11 = (gcnew System::Windows::Forms::Button());
			this->textBox1 = (gcnew System::Windows::Forms::TextBox());
			this->button12 = (gcnew System::Windows::Forms::Button());
			this->button13 = (gcnew System::Windows::Forms::Button());
			this->button14 = (gcnew System::Windows::Forms::Button());
			this->button15 = (gcnew System::Windows::Forms::Button());
			this->button16 = (gcnew System::Windows::Forms::Button());
			this->button17 = (gcnew System::Windows::Forms::Button());
			this->button18 = (gcnew System::Windows::Forms::Button());
			this->button19 = (gcnew System::Windows::Forms::Button());
			this->button20 = (gcnew System::Windows::Forms::Button());
			this->button21 = (gcnew System::Windows::Forms::Button());
			this->button22 = (gcnew System::Windows::Forms::Button());
			this->button23 = (gcnew System::Windows::Forms::Button());
			this->button24 = (gcnew System::Windows::Forms::Button());
			this->button25 = (gcnew System::Windows::Forms::Button());
			this->button26 = (gcnew System::Windows::Forms::Button());
			this->SuspendLayout();
			// 
			// button1
			// 
			this->button1->Location = System::Drawing::Point(49, 142);
			this->button1->Name = L"button1";
			this->button1->Size = System::Drawing::Size(34, 23);
			this->button1->TabIndex = 0;
			this->button1->Text = L"1";
			this->button1->UseVisualStyleBackColor = true;
			this->button1->Click += gcnew System::EventHandler(this, &Form1::button1_Click);
			// 
			// button2
			// 
			this->button2->Location = System::Drawing::Point(89, 142);
			this->button2->Name = L"button2";
			this->button2->Size = System::Drawing::Size(34, 23);
			this->button2->TabIndex = 1;
			this->button2->Text = L"2";
			this->button2->UseVisualStyleBackColor = true;
			this->button2->Click += gcnew System::EventHandler(this, &Form1::button2_Click);
			// 
			// button3
			// 
			this->button3->Location = System::Drawing::Point(129, 142);
			this->button3->Name = L"button3";
			this->button3->Size = System::Drawing::Size(34, 23);
			this->button3->TabIndex = 2;
			this->button3->Text = L"3";
			this->button3->UseVisualStyleBackColor = true;
			this->button3->Click += gcnew System::EventHandler(this, &Form1::button3_Click);
			// 
			// button4
			// 
			this->button4->Location = System::Drawing::Point(49, 113);
			this->button4->Name = L"button4";
			this->button4->Size = System::Drawing::Size(34, 23);
			this->button4->TabIndex = 3;
			this->button4->Text = L"4";
			this->button4->UseVisualStyleBackColor = true;
			this->button4->Click += gcnew System::EventHandler(this, &Form1::button4_Click);
			// 
			// button5
			// 
			this->button5->Location = System::Drawing::Point(89, 113);
			this->button5->Name = L"button5";
			this->button5->Size = System::Drawing::Size(34, 23);
			this->button5->TabIndex = 4;
			this->button5->Text = L"5";
			this->button5->UseVisualStyleBackColor = true;
			this->button5->Click += gcnew System::EventHandler(this, &Form1::button5_Click);
			// 
			// button6
			// 
			this->button6->Location = System::Drawing::Point(129, 113);
			this->button6->Name = L"button6";
			this->button6->Size = System::Drawing::Size(34, 23);
			this->button6->TabIndex = 5;
			this->button6->Text = L"6";
			this->button6->UseVisualStyleBackColor = true;
			this->button6->Click += gcnew System::EventHandler(this, &Form1::button6_Click);
			// 
			// button7
			// 
			this->button7->Location = System::Drawing::Point(49, 84);
			this->button7->Name = L"button7";
			this->button7->Size = System::Drawing::Size(34, 23);
			this->button7->TabIndex = 6;
			this->button7->Text = L"7";
			this->button7->UseVisualStyleBackColor = true;
			this->button7->Click += gcnew System::EventHandler(this, &Form1::button7_Click);
			// 
			// button8
			// 
			this->button8->Location = System::Drawing::Point(89, 84);
			this->button8->Name = L"button8";
			this->button8->Size = System::Drawing::Size(34, 23);
			this->button8->TabIndex = 7;
			this->button8->Text = L"8";
			this->button8->UseVisualStyleBackColor = true;
			this->button8->Click += gcnew System::EventHandler(this, &Form1::button8_Click);
			// 
			// button9
			// 
			this->button9->Location = System::Drawing::Point(129, 84);
			this->button9->Name = L"button9";
			this->button9->Size = System::Drawing::Size(34, 23);
			this->button9->TabIndex = 8;
			this->button9->Text = L"9";
			this->button9->UseVisualStyleBackColor = true;
			this->button9->Click += gcnew System::EventHandler(this, &Form1::button9_Click);
			// 
			// button10
			// 
			this->button10->Location = System::Drawing::Point(49, 171);
			this->button10->Name = L"button10";
			this->button10->Size = System::Drawing::Size(74, 23);
			this->button10->TabIndex = 9;
			this->button10->Text = L"0";
			this->button10->UseVisualStyleBackColor = true;
			this->button10->Click += gcnew System::EventHandler(this, &Form1::button10_Click);
			// 
			// button11
			// 
			this->button11->Location = System::Drawing::Point(129, 171);
			this->button11->Name = L"button11";
			this->button11->Size = System::Drawing::Size(34, 23);
			this->button11->TabIndex = 10;
			this->button11->Text = L".";
			this->button11->UseVisualStyleBackColor = true;
			this->button11->Click += gcnew System::EventHandler(this, &Form1::button11_Click);
			// 
			// textBox1
			// 
			this->textBox1->Location = System::Drawing::Point(49, 23);
			this->textBox1->Name = L"textBox1";
			this->textBox1->ReadOnly = true;
			this->textBox1->Size = System::Drawing::Size(234, 20);
			this->textBox1->TabIndex = 11;
			this->textBox1->Text = L"0";
			// 
			// button12
			// 
			this->button12->Font = (gcnew System::Drawing::Font(L"Microsoft Sans Serif", 9.75F, System::Drawing::FontStyle::Regular, System::Drawing::GraphicsUnit::Point, 
				static_cast<System::Byte>(0)));
			this->button12->Location = System::Drawing::Point(169, 171);
			this->button12->Name = L"button12";
			this->button12->Size = System::Drawing::Size(34, 23);
			this->button12->TabIndex = 12;
			this->button12->Text = L"+";
			this->button12->UseVisualStyleBackColor = true;
			this->button12->Click += gcnew System::EventHandler(this, &Form1::button12_Click);
			// 
			// button13
			// 
			this->button13->Font = (gcnew System::Drawing::Font(L"Microsoft Sans Serif", 9.75F, System::Drawing::FontStyle::Regular, System::Drawing::GraphicsUnit::Point, 
				static_cast<System::Byte>(0)));
			this->button13->Location = System::Drawing::Point(169, 142);
			this->button13->Name = L"button13";
			this->button13->Size = System::Drawing::Size(34, 23);
			this->button13->TabIndex = 13;
			this->button13->Text = L"-";
			this->button13->UseVisualStyleBackColor = true;
			this->button13->Click += gcnew System::EventHandler(this, &Form1::button13_Click);
			// 
			// button14
			// 
			this->button14->Font = (gcnew System::Drawing::Font(L"Microsoft Sans Serif", 9.75F, System::Drawing::FontStyle::Regular, System::Drawing::GraphicsUnit::Point, 
				static_cast<System::Byte>(0)));
			this->button14->Location = System::Drawing::Point(169, 113);
			this->button14->Name = L"button14";
			this->button14->Size = System::Drawing::Size(34, 23);
			this->button14->TabIndex = 14;
			this->button14->Text = L"*";
			this->button14->UseVisualStyleBackColor = true;
			this->button14->Click += gcnew System::EventHandler(this, &Form1::button14_Click);
			// 
			// button15
			// 
			this->button15->Font = (gcnew System::Drawing::Font(L"Microsoft Sans Serif", 8.25F, System::Drawing::FontStyle::Regular, System::Drawing::GraphicsUnit::Point, 
				static_cast<System::Byte>(0)));
			this->button15->Location = System::Drawing::Point(169, 84);
			this->button15->Name = L"button15";
			this->button15->Size = System::Drawing::Size(34, 23);
			this->button15->TabIndex = 15;
			this->button15->Text = L"/";
			this->button15->UseVisualStyleBackColor = true;
			this->button15->Click += gcnew System::EventHandler(this, &Form1::button15_Click);
			// 
			// button16
			// 
			this->button16->Enabled = false;
			this->button16->Font = (gcnew System::Drawing::Font(L"Microsoft Sans Serif", 12, System::Drawing::FontStyle::Regular, System::Drawing::GraphicsUnit::Point, 
				static_cast<System::Byte>(0)));
			this->button16->Location = System::Drawing::Point(209, 142);
			this->button16->Name = L"button16";
			this->button16->Size = System::Drawing::Size(34, 52);
			this->button16->TabIndex = 16;
			this->button16->Text = L"=";
			this->button16->UseVisualStyleBackColor = true;
			this->button16->Click += gcnew System::EventHandler(this, &Form1::button16_Click);
			// 
			// button17
			// 
			this->button17->Location = System::Drawing::Point(49, 55);
			this->button17->Name = L"button17";
			this->button17->Size = System::Drawing::Size(74, 23);
			this->button17->TabIndex = 17;
			this->button17->Text = L"C";
			this->button17->UseVisualStyleBackColor = true;
			this->button17->Click += gcnew System::EventHandler(this, &Form1::button17_Click);
			// 
			// button18
			// 
			this->button18->Location = System::Drawing::Point(129, 55);
			this->button18->Name = L"button18";
			this->button18->Size = System::Drawing::Size(74, 23);
			this->button18->TabIndex = 18;
			this->button18->Text = L"CE";
			this->button18->UseVisualStyleBackColor = true;
			this->button18->Click += gcnew System::EventHandler(this, &Form1::button18_Click);
			// 
			// button19
			// 
			this->button19->Font = (gcnew System::Drawing::Font(L"Microsoft Sans Serif", 8.25F, System::Drawing::FontStyle::Regular, System::Drawing::GraphicsUnit::Point, 
				static_cast<System::Byte>(0)));
			this->button19->Location = System::Drawing::Point(209, 113);
			this->button19->Name = L"button19";
			this->button19->Size = System::Drawing::Size(34, 23);
			this->button19->TabIndex = 19;
			this->button19->Text = L"1/x";
			this->button19->UseVisualStyleBackColor = true;
			this->button19->Click += gcnew System::EventHandler(this, &Form1::button19_Click);
			// 
			// button20
			// 
			this->button20->Font = (gcnew System::Drawing::Font(L"Microsoft Sans Serif", 8.25F, System::Drawing::FontStyle::Regular, System::Drawing::GraphicsUnit::Point, 
				static_cast<System::Byte>(0)));
			this->button20->Location = System::Drawing::Point(209, 55);
			this->button20->Name = L"button20";
			this->button20->Size = System::Drawing::Size(34, 23);
			this->button20->TabIndex = 20;
			this->button20->Text = L"+/-";
			this->button20->UseVisualStyleBackColor = true;
			this->button20->Click += gcnew System::EventHandler(this, &Form1::button20_Click);
			// 
			// button21
			// 
			this->button21->Enabled = false;
			this->button21->Font = (gcnew System::Drawing::Font(L"Microsoft Sans Serif", 8.25F, System::Drawing::FontStyle::Regular, System::Drawing::GraphicsUnit::Point, 
				static_cast<System::Byte>(0)));
			this->button21->Location = System::Drawing::Point(209, 84);
			this->button21->Name = L"button21";
			this->button21->Size = System::Drawing::Size(34, 23);
			this->button21->TabIndex = 21;
			this->button21->Text = L"%";
			this->button21->UseVisualStyleBackColor = true;
			this->button21->Click += gcnew System::EventHandler(this, &Form1::button21_Click);
			// 
			// button22
			// 
			this->button22->Font = (gcnew System::Drawing::Font(L"Microsoft Sans Serif", 8.25F, System::Drawing::FontStyle::Regular, System::Drawing::GraphicsUnit::Point, 
				static_cast<System::Byte>(0)));
			this->button22->Location = System::Drawing::Point(249, 84);
			this->button22->Name = L"button22";
			this->button22->Size = System::Drawing::Size(34, 23);
			this->button22->TabIndex = 22;
			this->button22->Text = L"√";
			this->button22->UseVisualStyleBackColor = true;
			this->button22->Click += gcnew System::EventHandler(this, &Form1::button22_Click);
			// 
			// button23
			// 
			this->button23->Location = System::Drawing::Point(249, 171);
			this->button23->Name = L"button23";
			this->button23->Size = System::Drawing::Size(34, 23);
			this->button23->TabIndex = 23;
			this->button23->Text = L"tan";
			this->button23->UseVisualStyleBackColor = true;
			this->button23->Click += gcnew System::EventHandler(this, &Form1::button23_Click);
			// 
			// button24
			// 
			this->button24->Location = System::Drawing::Point(249, 142);
			this->button24->Name = L"button24";
			this->button24->Size = System::Drawing::Size(34, 23);
			this->button24->TabIndex = 24;
			this->button24->Text = L"sin";
			this->button24->UseVisualStyleBackColor = true;
			this->button24->Click += gcnew System::EventHandler(this, &Form1::button24_Click);
			// 
			// button25
			// 
			this->button25->Location = System::Drawing::Point(249, 113);
			this->button25->Name = L"button25";
			this->button25->Size = System::Drawing::Size(34, 23);
			this->button25->TabIndex = 25;
			this->button25->Text = L"cos";
			this->button25->UseVisualStyleBackColor = true;
			this->button25->Click += gcnew System::EventHandler(this, &Form1::button25_Click);
			// 
			// button26
			// 
			this->button26->Font = (gcnew System::Drawing::Font(L"Microsoft Sans Serif", 8.25F, System::Drawing::FontStyle::Regular, System::Drawing::GraphicsUnit::Point, 
				static_cast<System::Byte>(0)));
			this->button26->Location = System::Drawing::Point(249, 55);
			this->button26->Name = L"button26";
			this->button26->Size = System::Drawing::Size(34, 23);
			this->button26->TabIndex = 26;
			this->button26->Text = L"^2";
			this->button26->UseVisualStyleBackColor = true;
			this->button26->Click += gcnew System::EventHandler(this, &Form1::button26_Click);
			// 
			// Form1
			// 
			this->AutoScaleDimensions = System::Drawing::SizeF(6, 13);
			this->AutoScaleMode = System::Windows::Forms::AutoScaleMode::Font;
			this->BackColor = System::Drawing::Color::Blue;
			this->ClientSize = System::Drawing::Size(336, 216);
			this->Controls->Add(this->button26);
			this->Controls->Add(this->button25);
			this->Controls->Add(this->button24);
			this->Controls->Add(this->button23);
			this->Controls->Add(this->button22);
			this->Controls->Add(this->button21);
			this->Controls->Add(this->button20);
			this->Controls->Add(this->button19);
			this->Controls->Add(this->button18);
			this->Controls->Add(this->button17);
			this->Controls->Add(this->button16);
			this->Controls->Add(this->button15);
			this->Controls->Add(this->button14);
			this->Controls->Add(this->button13);
			this->Controls->Add(this->button12);
			this->Controls->Add(this->textBox1);
			this->Controls->Add(this->button11);
			this->Controls->Add(this->button10);
			this->Controls->Add(this->button9);
			this->Controls->Add(this->button8);
			this->Controls->Add(this->button7);
			this->Controls->Add(this->button6);
			this->Controls->Add(this->button5);
			this->Controls->Add(this->button4);
			this->Controls->Add(this->button3);
			this->Controls->Add(this->button2);
			this->Controls->Add(this->button1);
			this->Name = L"Form1";
			this->Text = L"Calculadora";
			this->ResumeLayout(false);
			this->PerformLayout();

		}
#pragma endregion
void ingresar(int n)
	{	if (textBox1->Text=="0")
			textBox1->Text=Convert::ToString(n);
		else
			textBox1->Text+=Convert::ToString(n);
	}
void signo(int k)
	{	double d=0;
		d=Convert::ToDouble(textBox1->Text);
		if (resta==true)
		{	d=d*(-1);
		}
		op=k;
		if ((op==3) || (op==4))
		{	a=d;
			button12->Enabled=false;
			button13->Enabled=false;
		}
		else
		{	a=a+d;
			if (op==2)
				resta=true;
			else
				resta=false;
		}
		textBox1->Text="0";
		p=false;
		button14->Enabled=false;
		button15->Enabled=false;
		button16->Enabled=true;
		button21->Enabled=true;	
	}
private: System::Void button1_Click(System::Object^  sender, System::EventArgs^  e) {
	ingresar(1);		
	 }
private: System::Void button2_Click(System::Object^  sender, System::EventArgs^  e) {
	ingresar(2);
	 }
private: System::Void button3_Click(System::Object^  sender, System::EventArgs^  e) {
	ingresar(3);
	 }
private: System::Void button4_Click(System::Object^  sender, System::EventArgs^  e) {
	ingresar(4);
	 }
private: System::Void button5_Click(System::Object^  sender, System::EventArgs^  e) {
	ingresar(5);
		 }
private: System::Void button6_Click(System::Object^  sender, System::EventArgs^  e) {
	ingresar(6);
		 }
private: System::Void button7_Click(System::Object^  sender, System::EventArgs^  e) {
	ingresar(7);
		 }
private: System::Void button8_Click(System::Object^  sender, System::EventArgs^  e) {
	ingresar(8);
		 }
private: System::Void button9_Click(System::Object^  sender, System::EventArgs^  e) {
	ingresar(9);
		 }
private: System::Void button11_Click(System::Object^  sender, System::EventArgs^  e) {
	if (p==false)
	{
		textBox1->Text+=".";
		p=true;
	}
		 }
private: System::Void button12_Click(System::Object^  sender, System::EventArgs^  e) {
	signo(1);
		 }
private: System::Void button13_Click(System::Object^  sender, System::EventArgs^  e) {
	signo(2);
		 }
private: System::Void button14_Click(System::Object^  sender, System::EventArgs^  e) {
	signo(3);
		 }
private: System::Void button15_Click(System::Object^  sender, System::EventArgs^  e) {
	signo(4);
		 }
private: System::Void button16_Click(System::Object^  sender, System::EventArgs^  e) {
	if (op==1)
	{	a=a+Convert::ToDouble(textBox1->Text);
		textBox1->Text=Convert::ToString(a);
	}
	else if (op==2)
	{	b=Convert::ToDouble(textBox1->Text);
		textBox1->Text=Convert::ToString(a-b);
	}
	else if (op==3)
	{	b=Convert::ToDouble(textBox1->Text);
		textBox1->Text=Convert::ToString(a*b);
	}
	else if (op==4)
	{	b=Convert::ToDouble(textBox1->Text);
		if (b!=0)
			textBox1->Text=Convert::ToString(a/b);
		else
			MessageBox::Show("Math Error");
	}
	button12->Enabled=true;
	button13->Enabled=true;
	button14->Enabled=true;
	button15->Enabled=true;
	button16->Enabled=false;
		 }
private: System::Void button17_Click(System::Object^  sender, System::EventArgs^  e) {
	textBox1->Text="0";
		 }
private: System::Void button18_Click(System::Object^  sender, System::EventArgs^  e) {
	textBox1->Text="0";
	a=0;
	b=0;
		 }
private: System::Void button19_Click(System::Object^  sender, System::EventArgs^  e) {
	b=Convert::ToDouble(textBox1->Text);
	if (b!=0)
		textBox1->Text=Convert::ToString(1/b);
	else
		MessageBox::Show("Math Error");
		 }
private: System::Void button20_Click(System::Object^  sender, System::EventArgs^  e) {
	textBox1->Text=Convert::ToString(Convert::ToDouble(textBox1->Text)*(-1));
		 }
private: System::Void button22_Click(System::Object^  sender, System::EventArgs^  e) {
	double c;
	c=Convert::ToDouble(textBox1->Text);
	if (c!=0)
		textBox1->Text=Convert::ToString(sqrt(c));
	else
		MessageBox::Show("Math Error");
		 }
private: System::Void button23_Click(System::Object^  sender, System::EventArgs^  e) {
	double c;
	c=Convert::ToDouble(textBox1->Text);
	if (cos(c*pi/180)!=0)
		textBox1->Text=Convert::ToString(tan(c*pi/180));
	else
		MessageBox::Show("Math Error");
		 }
private: System::Void button24_Click(System::Object^  sender, System::EventArgs^  e) {
	textBox1->Text=Convert::ToString(sin(Convert::ToDouble(textBox1->Text)*pi/180));
		 }
private: System::Void button25_Click(System::Object^  sender, System::EventArgs^  e) {
	textBox1->Text=Convert::ToString(cos(Convert::ToDouble(textBox1->Text)*pi/180));
		 }
private: System::Void button21_Click(System::Object^  sender, System::EventArgs^  e) {
	textBox1->Text=Convert::ToString(a*Convert::ToDouble(textBox1->Text)/100);
		 }
private: System::Void button26_Click(System::Object^  sender, System::EventArgs^  e) {
	textBox1->Text=Convert::ToString(Convert::ToDouble(textBox1->Text)*Convert::ToDouble(textBox1->Text));
		 }
private: System::Void button10_Click(System::Object^  sender, System::EventArgs^  e) {
	ingresar(0);
		 }
};
}


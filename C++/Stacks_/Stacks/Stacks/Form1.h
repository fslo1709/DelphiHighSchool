#pragma once
#include "stack.h"
namespace Stacks {

	using namespace System;
	using namespace System::ComponentModel;
	using namespace System::Collections;
	using namespace System::Windows::Forms;
	using namespace System::Data;
	using namespace System::Drawing;

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
			this->components = gcnew System::ComponentModel::Container();
			this->Size = System::Drawing::Size(300,300);
	
			this->Text = L"Form1";
			this->Padding = System::Windows::Forms::Padding(0);
			this->AutoScaleMode = System::Windows::Forms::AutoScaleMode::Font;
		}
#pragma endregion
	};
	ref class tstack {
	private: 
		int sp;
		array<int>^data;
	public:
		tstack();
		void push(int);
		int pop();
	};
	tstack::tstack(){
		sp=0;
		data=gcnew array<int>(5);
	}
	void tstack::push(int e)
	{
		if (sp<5)
			data[sp++]=e;
		else
			MessageBox::Show("Stack Overflow");
	}
	int tstack::pop()
	{
		if (sp>0)
			return data[--sp];
		else
		{	MessageBox::Show("Stack Underflow");
			return 0;
		}
	}
}


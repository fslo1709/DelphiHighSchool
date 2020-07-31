using namespace System::Windows::Forms;
using namespace System;

ref class tstack{
	private:
		Form^ parent;
		int bsp;
		Label^ flecha;
		property int sp {
			int get(){return bsp;}
			void set(int x){
				bsp=x; 
				flecha->Top=data[0]->Top-bsp*20+22;
			}
		}
		array<TextBox^>^ data;
	public:
		void kliq(Object^ s,EventArgs^ e);
		tstack(Form^,int,int);
		void push(int);
		int pop();
		int t();
		bool empty();
};

tstack::tstack(Form^ f,int x,int y){
	data=gcnew array<TextBox^>(5);
	for(int i=0;i<5;i++){
		data[i]=gcnew TextBox();
		f->Controls->Add(data[i]);
		data[i]->Left=x;
		data[i]->Width=30;
		data[i]->Top=(4-i)*20+y;
		data[i]->Click+= gcnew EventHandler(this, &tstack::kliq);
	}
	flecha = gcnew Label();
	f->Controls->Add(flecha);
	flecha->Left=x+32;
	flecha->Width=22;
	flecha->Text="<---";
	sp=0;
	parent=f;
}

void tstack::push(int e){
	if (sp<5){
		data[sp]->Text=Convert::ToString(e);
		sp++;
	}
	else 
		MessageBox::Show("Stack Overflow");
}

int tstack::pop(){
	if (sp>0){
		sp--;
		data[sp]->Text="";
	}
	else {
		MessageBox::Show("Stack Underflow");
		return 0;
	}
}

int tstack::t(){
	if (sp>0)
		return Convert::ToInt32(data[sp-1]->Text);
	else {
		MessageBox::Show("Stack Underflow");
		return 0;
	}
}

bool tstack::empty(){
	return sp<1;
}


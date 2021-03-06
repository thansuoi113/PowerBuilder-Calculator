$PBExportHeader$w_calculator.srw
forward
global type w_calculator from window
end type
type sle_2 from singlelineedit within w_calculator
end type
type sle_1 from singlelineedit within w_calculator
end type
type cb_digitdot from commandbutton within w_calculator
end type
type cb_equal from commandbutton within w_calculator
end type
type cb_divide from commandbutton within w_calculator
end type
type cb_multiply from commandbutton within w_calculator
end type
type cb_minus from commandbutton within w_calculator
end type
type cb_plus from commandbutton within w_calculator
end type
type cb_digit0 from commandbutton within w_calculator
end type
type cb_digit9 from commandbutton within w_calculator
end type
type cb_digit6 from commandbutton within w_calculator
end type
type cb_digit5 from commandbutton within w_calculator
end type
type cb_digit8 from commandbutton within w_calculator
end type
type cb_digit7 from commandbutton within w_calculator
end type
type cb_digit4 from commandbutton within w_calculator
end type
type cb_digit3 from commandbutton within w_calculator
end type
type cb_digit2 from commandbutton within w_calculator
end type
type cb_digit1 from commandbutton within w_calculator
end type
type cb_ce from commandbutton within w_calculator
end type
end forward

global type w_calculator from window
integer width = 809
integer height = 1020
boolean titlebar = true
string title = "Calculator"
boolean controlmenu = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
sle_2 sle_2
sle_1 sle_1
cb_digitdot cb_digitdot
cb_equal cb_equal
cb_divide cb_divide
cb_multiply cb_multiply
cb_minus cb_minus
cb_plus cb_plus
cb_digit0 cb_digit0
cb_digit9 cb_digit9
cb_digit6 cb_digit6
cb_digit5 cb_digit5
cb_digit8 cb_digit8
cb_digit7 cb_digit7
cb_digit4 cb_digit4
cb_digit3 cb_digit3
cb_digit2 cb_digit2
cb_digit1 cb_digit1
cb_ce cb_ce
end type
global w_calculator w_calculator

type variables
Decimal add1 // store operands
 Char s1 // store operator
 Int flag //Check if the calculation is complete


end variables

forward prototypes
public subroutine wf_operator (commandbutton cba)
public subroutine wf_digit (commandbutton cba)
end prototypes

public subroutine wf_operator (commandbutton cba);//====================================================================
// Function: w_calculator.wf_operator()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value	commandbutton	cba	
//--------------------------------------------------------------------
// Returns:  (none)
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/06/18
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Choose Case  s1
	Case  '*'
		sle_2.Text = String(Dec(sle_2.Text)*add1)
	Case '/'
		sle_2.Text = String(add1/Dec(sle_2.Text))
	Case  '+'
		sle_2.Text = String(Dec(sle_2.Text)+add1)
	Case '-'
		sle_2.Text = String(add1 - Dec(sle_2.Text))
End Choose
add1 = Dec(sle_2.Text) //Retain intermediate results
s1 = cba.Text // keep the operator just pressed
Flag = 0 //Ready to enter the next number
sle_1.Text = sle_1.Text+cba.Text


end subroutine

public subroutine wf_digit (commandbutton cba);//====================================================================
// Function: w_calculator.wf_digit()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value	commandbutton	cba	
//--------------------------------------------------------------------
// Returns:  (none)
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/06/18
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

If flag = 0 Then
	Sle_2.Text = "" //Clear the contents of the sle_2.text text box
	flag = 1 //
End If
/* If you don't judge, after you click the = button for the first time, you can start the second calculation without clicking the ce button.
   The value displayed on the text box will be the result of your first calculation and the value you just clicked, displayed together;
(The result of the first calculation is 10, you clicked 3, the text box shows 103) */
If s1 = "=" Then
	sle_1.Text = " "
	s1 = ""
End If
sle_1.Text = sle_1.Text+cba.Text
Sle_2.Text = Sle_2.Text+cba.Text



end subroutine

on w_calculator.create
this.sle_2=create sle_2
this.sle_1=create sle_1
this.cb_digitdot=create cb_digitdot
this.cb_equal=create cb_equal
this.cb_divide=create cb_divide
this.cb_multiply=create cb_multiply
this.cb_minus=create cb_minus
this.cb_plus=create cb_plus
this.cb_digit0=create cb_digit0
this.cb_digit9=create cb_digit9
this.cb_digit6=create cb_digit6
this.cb_digit5=create cb_digit5
this.cb_digit8=create cb_digit8
this.cb_digit7=create cb_digit7
this.cb_digit4=create cb_digit4
this.cb_digit3=create cb_digit3
this.cb_digit2=create cb_digit2
this.cb_digit1=create cb_digit1
this.cb_ce=create cb_ce
this.Control[]={this.sle_2,&
this.sle_1,&
this.cb_digitdot,&
this.cb_equal,&
this.cb_divide,&
this.cb_multiply,&
this.cb_minus,&
this.cb_plus,&
this.cb_digit0,&
this.cb_digit9,&
this.cb_digit6,&
this.cb_digit5,&
this.cb_digit8,&
this.cb_digit7,&
this.cb_digit4,&
this.cb_digit3,&
this.cb_digit2,&
this.cb_digit1,&
this.cb_ce}
end on

on w_calculator.destroy
destroy(this.sle_2)
destroy(this.sle_1)
destroy(this.cb_digitdot)
destroy(this.cb_equal)
destroy(this.cb_divide)
destroy(this.cb_multiply)
destroy(this.cb_minus)
destroy(this.cb_plus)
destroy(this.cb_digit0)
destroy(this.cb_digit9)
destroy(this.cb_digit6)
destroy(this.cb_digit5)
destroy(this.cb_digit8)
destroy(this.cb_digit7)
destroy(this.cb_digit4)
destroy(this.cb_digit3)
destroy(this.cb_digit2)
destroy(this.cb_digit1)
destroy(this.cb_ce)
end on

event open;sle_2.SetFocus()
end event

type sle_2 from singlelineedit within w_calculator
integer x = 37
integer y = 120
integer width = 695
integer height = 96
integer taborder = 180
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean border = false
boolean displayonly = true
end type

type sle_1 from singlelineedit within w_calculator
integer x = 37
integer y = 32
integer width = 695
integer height = 96
integer taborder = 190
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean border = false
boolean displayonly = true
end type

type cb_digitdot from commandbutton within w_calculator
integer x = 402
integer y = 768
integer width = 146
integer height = 112
integer taborder = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "."
end type

event clicked;wf_digit(This)
end event

type cb_equal from commandbutton within w_calculator
integer x = 585
integer y = 768
integer width = 146
integer height = 112
integer taborder = 170
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "="
boolean default = true
end type

event clicked;wf_operator(This)

end event

type cb_divide from commandbutton within w_calculator
integer x = 585
integer y = 640
integer width = 146
integer height = 112
integer taborder = 160
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "/"
end type

event clicked;wf_operator(This)

end event

type cb_multiply from commandbutton within w_calculator
integer x = 585
integer y = 512
integer width = 146
integer height = 112
integer taborder = 150
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "*"
end type

event clicked;wf_operator(This)

end event

type cb_minus from commandbutton within w_calculator
integer x = 585
integer y = 384
integer width = 146
integer height = 112
integer taborder = 140
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "-"
end type

event clicked;wf_operator(This)


end event

type cb_plus from commandbutton within w_calculator
integer x = 585
integer y = 256
integer width = 146
integer height = 112
integer taborder = 130
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "+"
end type

event clicked;wf_operator(This)

end event

type cb_digit0 from commandbutton within w_calculator
integer x = 37
integer y = 768
integer width = 329
integer height = 112
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "0"
end type

event clicked;wf_digit(This)
end event

type cb_digit9 from commandbutton within w_calculator
integer x = 402
integer y = 640
integer width = 146
integer height = 112
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "9"
end type

event clicked;wf_digit(This)
end event

type cb_digit6 from commandbutton within w_calculator
integer x = 402
integer y = 512
integer width = 146
integer height = 112
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "6"
end type

event clicked;wf_digit(This)
end event

type cb_digit5 from commandbutton within w_calculator
integer x = 219
integer y = 512
integer width = 146
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "5"
end type

event clicked;wf_digit(This)
end event

type cb_digit8 from commandbutton within w_calculator
integer x = 219
integer y = 640
integer width = 146
integer height = 112
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "8"
end type

event clicked;wf_digit(This)
end event

type cb_digit7 from commandbutton within w_calculator
integer x = 37
integer y = 640
integer width = 146
integer height = 112
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "7"
end type

event clicked;wf_digit(This)
end event

type cb_digit4 from commandbutton within w_calculator
integer x = 37
integer y = 512
integer width = 146
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "4"
end type

event clicked;wf_digit(This)
end event

type cb_digit3 from commandbutton within w_calculator
integer x = 402
integer y = 384
integer width = 146
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "3"
end type

event clicked;wf_digit(This)
end event

type cb_digit2 from commandbutton within w_calculator
integer x = 219
integer y = 384
integer width = 146
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "2"
end type

event clicked;wf_digit(This)
end event

type cb_digit1 from commandbutton within w_calculator
integer x = 37
integer y = 384
integer width = 146
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "1"
end type

event clicked;wf_digit(This)
end event

type cb_ce from commandbutton within w_calculator
integer x = 37
integer y = 256
integer width = 512
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "CE"
end type

event clicked;add1 = 0
s1   = ''
flag  = 0
sle_1.Text = ''
sle_2.Text = ''



end event


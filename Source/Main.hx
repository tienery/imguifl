package;

import openfl.display.Sprite;
import imguifl.components.Text;
import imguifl.components.Checkbox;
import imguifl.components.Radiobox;
import imguifl.components.NumericUpDown;
import imguifl.forms.FormGenerator;
import imguifl.Fonts;

class Main extends Sprite {
	
	
	public function new () {
		
		super ();
		
		Fonts.init();
		
		testFormGenerator();
		//testNumeric();
		//testRadio();
	}
	
	private function testFormGenerator()
	{
		var values:Dynamic = {
			id: 0,
			message: "width:150|height:200|multiline:true|wordWrap:true",
			checked: false
		};
		
		var _lbl = new Text("", "crimsontext_roman");
		var form = FormGenerator.generate(values, "crimsontext_bold", "crimsontext_roman", function(results)
		{
			_lbl.text = "ID: " + results.id + ", Message: " + results.message + ", Checked: " + results.checked;
		});
		
		_lbl.y = form.height + 3;
		
		addChild(form);
		addChild(_lbl);
	}
	
	private function testNumeric()
	{
		var nud = new NumericUpDown(20, "crimsontext_semibold");
		nud.x = 5;
		nud.y = 5;
		nud.baseColor = 0x666666;
		nud.overColor = 0x999999;
		nud.downColor = 0x333333;
		
		addChild(nud);
	}
	
	private function testRadio()
	{
		var chb = new Radiobox("Radiobox A", "crimsontext_semibold");
		chb.x = 5;
		chb.y = 5;
		chb.overColor = 0x999999;
		chb.downColor = 0x333333;
		chb.baseColor = 0x666666;
		
		var chb2 = new Radiobox("Radiobox B", "crimsontext_semibold");
		chb2.x = 5;
		chb2.y = 31;
		chb2.overColor = 0x999999;
		chb2.downColor = 0x333333;
		chb2.baseColor = 0x666666;
		
		addChild(chb);
		addChild(chb2);
	}
	
	
}
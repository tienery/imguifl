package imguifl.components;

import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFieldAutoSize;
import openfl.text.TextFieldType;
import imguifl.Fonts;

class TextInput extends TextField
{
    
    public function new(value:String, fontName:String)
    {
        super();
        
        defaultTextFormat = Fonts.fonts.get(fontName);
        type = TextFieldType.INPUT;
        wordWrap = false;
        selectable = true;
        multiline = false;
        text = value;
        border = true;
    }
    
}
package imguifl.components;

import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFieldAutoSize;
import imguifl.Fonts;

class Text extends TextField
{
    
    public function new(value:String, fontName:String)
    {
        super();
        
        defaultTextFormat = Fonts.fonts.get(fontName);
        autoSize = TextFieldAutoSize.LEFT;
        wordWrap = false;
        selectable = false;
        multiline = false;
        text = value;
    }
    
}
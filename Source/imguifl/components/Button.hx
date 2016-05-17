package imguifl.components;

import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.text.TextFieldAutoSize;
import openfl.text.TextFormat;
import openfl.events.MouseEvent;
import openfl.Assets;

class Button extends Sprite
{
    
    private var _txtMain:Text;
    
    public function new(value:String, fontName:String)
    {
        super();
        
        buttonMode = true;
        _txtMain = new Text(value, fontName);
        _txtMain.textColor = 0x444444;
        
        _txtMain.addEventListener(MouseEvent.MOUSE_OVER, _button_mouseOver);
        _txtMain.addEventListener(MouseEvent.MOUSE_DOWN, _button_mouseDown);
        _txtMain.addEventListener(MouseEvent.MOUSE_OUT, _button_mouseLeave);
        _txtMain.addEventListener(MouseEvent.MOUSE_UP, _button_mouseUp);
        
        addChild(_txtMain);
    }
    
    private function _button_mouseOver(e:MouseEvent)
    {
        _txtMain.textColor = 0x777777;
    }
    
    private function _button_mouseDown(e:MouseEvent)
    {
        _txtMain.textColor = 0x222222;
    }
    
    private function _button_mouseUp(e:MouseEvent)
    {
        _txtMain.textColor = 0x777777;
    }
    
    private function _button_mouseLeave(e:MouseEvent)
    {
        _txtMain.textColor = 0x444444;
    }
    
}
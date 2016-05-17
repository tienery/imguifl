package imguifl.components;

import openfl.display.Sprite;
import openfl.events.MouseEvent;

class Checkbox extends Sprite
{
    
    private var _isDown:Bool;
    private var _isOver:Bool;
    private var _txtMain:Text;
    
    
    private var _baseColor:Int;
    public var baseColor(get, set):Int;
    function get_baseColor() return _baseColor;
    function set_baseColor(val)
    {
        _baseColor = val;
        redraw();
        return _baseColor;
    }
    
    private var _overColor:Int;
    public var overColor(get, set):Int;
    function get_overColor() return _overColor;
    function set_overColor(val)
    {
        _overColor = val;
        redraw();
        return _overColor;
    }
    
    private var _downColor:Int;
    public var downColor(get, set):Int;
    function get_downColor() return _downColor;
    function set_downColor(val)
    {
        _downColor = val;
        redraw();
        return _downColor;
    }
    
    private var _checked:Bool;
    public var checked(get, set):Bool;
    function get_checked() return _checked;
    function set_checked(val)
    {
        _checked = val;
        redraw();
        return _checked;
    }
    
    public function new(value:String, fontName:String, checked:Bool = false)
    {
        super();
        
        _txtMain = new Text(value, fontName);
        
        _downColor = 0x333333;
        _overColor = 0x999999;
        _baseColor = 0x666666;
        
        addChild(_txtMain);
        
        addEventListener(MouseEvent.CLICK, _checkbox_onClick);
        addEventListener(MouseEvent.MOUSE_UP, function(e) {
            _isDown = false;
            _isOver = true;
            redraw();
        });
        
        addEventListener(MouseEvent.MOUSE_DOWN, function(e) {
            _isDown = true;
            _isOver = false;
            redraw();
        });
        
        addEventListener(MouseEvent.MOUSE_OUT, function(e) {
            _isDown = false;
            _isOver = false;
            redraw();
        });
        
        addEventListener(MouseEvent.MOUSE_OVER, function(e) {
            _isDown = false;
            _isOver = true;
            redraw();
        });
        
        redraw();
    }
    
    private function _checkbox_onClick(e:MouseEvent)
    {
        _checked = !_checked;
        redraw();
    }
    
    private function redraw()
    {
        graphics.clear();
        
        if (_isDown)
            graphics.lineStyle(1, _downColor);
        else if (_isOver)
            graphics.lineStyle(1, _overColor);
        else
            graphics.lineStyle(1, _baseColor);
        
        graphics.drawRect(0, 0, 24, 24);
        
        if (_checked)
        {
            graphics.moveTo(0, 24);
            graphics.lineTo(24, 0);
        }
        
        _txtMain.x = 26;
        _txtMain.y = (height - _txtMain.height) / 2;
    }
    
}
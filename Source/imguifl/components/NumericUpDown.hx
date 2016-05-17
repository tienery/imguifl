package imguifl.components;

import openfl.display.Sprite;
import openfl.events.KeyboardEvent;
import openfl.events.FocusEvent;
import openfl.events.MouseEvent;
import openfl.ui.Keyboard;

class NumericUpDown extends Sprite
{
    
    private var _txtMain:TextInput;
    private var _arrowUp:Arrow;
    private var _arrowDown:Arrow;
    
    private var _baseColor:Int;
    public var baseColor(get, set):Int;
    function get_baseColor() return _baseColor;
    function set_baseColor(val)
    {
        _baseColor = val;
        _arrowUp.baseColor = val;
        _arrowDown.baseColor = val;
        return _baseColor;
    }
    
    private var _overColor:Int;
    public var overColor(get, set):Int;
    function get_overColor() return _overColor;
    function set_overColor(val)
    {
        _overColor = val;
        _arrowUp.overColor = val;
        _arrowDown.overColor = val;
        return _overColor;
    }
    
    private var _downColor:Int;
    public var downColor(get, set):Int;
    function get_downColor() return _downColor;
    function set_downColor(val)
    {
        _downColor = val;
        _arrowUp.downColor = val;
        _arrowDown.downColor = val;
        return _downColor;
    }
    
    private var _decimalPlaces:Int;
    public var decimalPlaces(get, set):Int;
    function get_decimalPlaces() return _decimalPlaces;
    function set_decimalPlaces(val)
    {
        _decimalPlaces = val;
        setValue();
        return _decimalPlaces;
    }
    
    private var _value:Float;
    public var value(get, set):Float;
    function get_value() return _value;
    function set_value(val)
    {
        if (val < minValue)
            _value = minValue;
        else if (val > maxValue)
            _value = maxValue;
        else
            _value = val;
        
        setValue();
        return _value;
    }
    
    private var _minValue:Float;
    public var minValue(get, set):Float;
    function get_minValue() return _minValue;
    function set_minValue(val)
    {
        _minValue = val;
        setValue();
        return _minValue;
    }
    
    private var _maxValue:Float;
    public var maxValue(get, set):Float;
    function get_maxValue() return _maxValue;
    function set_maxValue(val)
    {
        _maxValue = val;
        setValue();
        return _maxValue;
    }
    
    public function new(value:Float, fontName:String, min:Float = 0, max:Float = 100)
    {
        super();
        
        _value = value;
        _maxValue = max;
        _minValue = min;
        _decimalPlaces = 0;
        
        _txtMain = new TextInput("", fontName);
        _txtMain.width = 100;
        _txtMain.height = 24;
        
        _arrowUp = new Arrow(12);
        _arrowDown = new Arrow(12);
        _arrowDown.direction = 2;
        _arrowUp.x = _arrowDown.x = 101;
        _arrowDown.y = 12;
        
        addChild(_txtMain);
        addChild(_arrowUp);
        addChild(_arrowDown);
        
        setValue();
        
        _txtMain.addEventListener(KeyboardEvent.KEY_UP, _txtMain_onKeyUp);
        _txtMain.addEventListener(FocusEvent.FOCUS_OUT, _txtMain_onFocusOut);
        _txtMain.addEventListener(MouseEvent.MOUSE_WHEEL, _txtMain_onMouseWheel);
        
        _arrowUp.addEventListener(MouseEvent.CLICK, _arrowUp_onClick);
        _arrowDown.addEventListener(MouseEvent.CLICK, _arrowDown_onClick);
    }
    
    private function _txtMain_onMouseWheel(e:MouseEvent)
    {
        if (e.delta > 0)
            value++;
        else if (e.delta < 0)
            value--;
    }
    
    private function _arrowUp_onClick(e:MouseEvent)
    {
        value++;
    }
    
    private function _arrowDown_onClick(e:MouseEvent)
    {
        value--;
    }
    
    private function _txtMain_onFocusOut(e:FocusEvent)
    {
        checkValue();
    }
    
    private function _txtMain_onKeyUp(e:KeyboardEvent)
    {
        if (e.keyCode == Keyboard.ENTER)
        {
            checkValue();
        }
    }
    
    private function checkValue()
    {
        var newValue:Float = Std.parseFloat(_txtMain.text);
        if (newValue == Math.NaN)
        {
            value = minValue;
        }
        else
        {
            value = newValue;
            setValue();
        }
    }
    
    private function setValue()
    {
        if (decimalPlaces > 0)
        {
            var places = Math.pow(10, decimalPlaces);
            var result:Int = Std.int(value * places);
            var finalResult:Float = result / places;
            
            if (finalResult < minValue)
                finalResult = minValue;
            else if (finalResult > maxValue)
                finalResult = maxValue;
            
            _txtMain.text = "" + finalResult;
        }
        else
        {
            var result:Float = Std.int(value);
            
            if (result < minValue)
                result = minValue;
            else if (result > maxValue)
                result = maxValue;
            
            _txtMain.text = "" + result;
        }
    }
    
}
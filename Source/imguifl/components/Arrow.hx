package imguifl.components;

import openfl.display.Sprite;
import openfl.events.MouseEvent;

class Arrow extends Sprite
{
    
    private var _height:Float;
    private var _isOver:Bool;
    private var _isDown:Bool;
    
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
    
    private var _direction:Int;
    /**
    * Specifies what direction the arrow is drawn in. `1` for up, `2` for down.
    */
    public var direction(get, set):Int;
    function get_direction() return _direction;
    function set_direction(val)
    {
        if (val < 1)
            val = 1;
        else if (val > 2)
            val = 2;
        
        _direction = val;
        
        redraw();
        return _direction;
    }
    
    public function new(height:Float = 24)
    {
        super();
        
        _height = height;
        _direction = 1;
        
        redraw();
        
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
    }
    
    private function redraw()
    {
        graphics.clear();
        
        if (_isDown)
        {
            graphics.beginFill(downColor);
        }
        else if (_isOver)
        {
            graphics.beginFill(overColor);
        }
        else
        {
            graphics.beginFill(baseColor);
        }
        
        graphics.drawRect(0, 0, 24, _height);
        
        graphics.lineStyle(1, 0xFFFFFF);
        
        var dirValue:Float = _direction == 1 ? 0.2 : 0.8;
        var base:Float = _direction == 1 ? 0.8 : 0.2;
        var baseValue = _height * base;
        
        graphics.moveTo(4, baseValue);
        graphics.lineTo(12, _height * dirValue);
        graphics.lineTo(20, baseValue);
    }
    
}
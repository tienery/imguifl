package imguifl.forms;

import openfl.display.Sprite;
import openfl.display.DisplayObject;
import openfl.events.MouseEvent;

import imguifl.components.Text;
import imguifl.components.TextInput;
import imguifl.components.Checkbox;
import imguifl.components.NumericUpDown;
import imguifl.components.Button;

class FormGenerator
{
    
    public static function generate(v:Dynamic, labelFontName:String, contentFontName:String, submit:Dynamic -> Void = null):Sprite
    {
        var result = new Sprite();
        
        var fields:Dynamic = Reflect.fields(v);
        for (i in 0...fields.length)
        {
            var field:Dynamic = fields[i];
            var fieldValue:Dynamic = Reflect.field(v, field);
            if (Std.is(fieldValue, String))
            {
                var _lbl = new Text(field, labelFontName);
                result.addChild(_lbl);
                var _txt = new TextInput("", contentFontName);
                var options = cast (fieldValue, String).split('|');
                for (i in 0...options.length)
                {
                    var _opt = options[i];
                    if (_opt.indexOf('width:') > -1)
                        _txt.width = Std.parseFloat(_opt.substr('width:'.length));
                    else if (_opt.indexOf('height:') > -1)
                        _txt.width = Std.parseFloat(_opt.substr('height:'.length));
                    else if (_opt.indexOf('multiline:') > -1)
                        _txt.multiline = _opt.substr('multiline:'.length) == 'true' ? true : false;
                    else if (_opt.indexOf('wordWrap:') > -1)
                        _txt.wordWrap = _opt.substr('wordWrap:'.length) == 'true' ? true : false;
                }
                _txt.x = _lbl.width + 2;
                _txt.name = field;
                result.addChild(_txt);
            }
            else if (Std.is(fieldValue, Bool))
            {
                var _chb = new Checkbox(field, labelFontName, (fieldValue == 'checked'));
                _chb.name = field;
                result.addChild(_chb);
            }
            else if (Std.is(fieldValue, Float))
            {
                var _lbl = new Text(field, labelFontName);
                result.addChild(_lbl);
                
                var _nud = new NumericUpDown(fieldValue, contentFontName);
                _nud.name = field;
                result.addChild(_nud);
            }
        }
        
        var previousObject:DisplayObject = null;
        var currentHeight:Float = 0;
        
        var _btnSubmit:Button = new Button("Submit", labelFontName);
        result.addChild(_btnSubmit);
        
        for (i in 0...result.numChildren)
        {
            var obj = result.getChildAt(i);
            if (Std.is(obj, Text))
            {
                previousObject = obj;
                obj.x = 4;
                obj.y = currentHeight + 4;
            }
            else if (Std.is(obj, TextInput))
            {
                if (previousObject != null && previousObject != obj)
                {
                    obj.x = previousObject.x + previousObject.width + 4;
                    obj.y = currentHeight + 4;
                    currentHeight += obj.height;
                }
            }
            else if (Std.is(obj, Checkbox))
            {
                obj.x = 4;
                obj.y = currentHeight + 4;
                currentHeight += obj.height;
            }
            else if (Std.is(obj, NumericUpDown))
            {
                if (previousObject != null && previousObject != obj)
                {
                    obj.x = previousObject.x + previousObject.width + 4;
                    obj.y = currentHeight + 4;
                    currentHeight += obj.height;
                }
            }
            else if (Std.is(obj, Button))
            {
                obj.x = 4;
                obj.y = currentHeight + 4;
                currentHeight += obj.height;
            }
        }
        
        _btnSubmit.addEventListener(MouseEvent.CLICK, function(e)
        {
            if (submit == null)
                return;
            
            var _returnResult:Dynamic = {};
            
            for (i in 0...result.numChildren)
            {
                var obj = result.getChildAt(i);
                if (Std.is(obj, TextInput))
                {
                    var casted:TextInput = cast (obj, TextInput);
                    Reflect.setField(_returnResult, casted.name, casted.text);
                }
                else if (Std.is(obj, Checkbox))
                {
                    var casted:Checkbox = cast (obj, Checkbox);
                    Reflect.setField(_returnResult, casted.name, casted.checked);
                }
                else if (Std.is(obj, NumericUpDown))
                {
                    var casted:NumericUpDown = cast(obj, NumericUpDown);
                    Reflect.setField(_returnResult, casted.name, casted.value);
                }
            }
            
            submit(_returnResult);
        });
        
        return result;
    }
    
}
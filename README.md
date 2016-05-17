# imguifl
While not **truly** immediate-mode, this library will "eventually" be a library for quick GUI design. By using anonymous structures in Haxe, you will be able to build GUI in very little time.

Because the caveat of OpenFL is that it is already a retained-mode games framework, using the same API design as immediate-mode GUI libraries such as "dear imgui" didn't really make sense (Perhaps it does make sense, I am open to suggestions). Instead, you build your user interface using an anonymous structure.

OpenFL is being used as the prime foundations for this library, and the only libraries that exist (as far as I am aware) that would allow for **true** immediate-mode GUI would be [Kha](https://github.com/KTXSoftware/Kha), [Linc SDL](https://github.com/snowkit/linc_sdl) and [hxsfml](https://github.com/tienery/hxsfml).

My ambition is to extend its current functionality, build UI with an API that makes sense, and finally test with the above mentioned libraries.

## Example

    package;
    
    import openfl.display.Sprite;
    import imguifl.forms.FormGenerator;
    import imguifl.Fonts;
    
    class Main extends Sprite
    {
        public function new()
        {
            super();
            
            Fonts.init();
            var formData:Dynamic = {
			        id: 0,
			        message: "width:150|height:200|multiline:true|wordWrap:true",
			        checked: false
		        };
		
		        var _lbl = new Text("", "crimsontext_roman");
        		var form = FormGenerator.generate(formData, "crimsontext_bold", "crimsontext_roman", function(results)
        		{
        			_lbl.text = "ID: " + results.id + ", Message: " + results.message + ", Checked: " + results.checked;
        		});
		
        		_lbl.y = form.height + 3;
        		
        		addChild(form);
        		addChild(_lbl);
        }
    }

Results:

![img](http://i.imgur.com/QDCzFZ4.png)

## Installation

You can install via `haxelib git`:

    haxelib git imguifl https://github.com/tienery/imguifl.git

It is currently not available directly on haxelib. It may be in the future.

## Immediate-Mode GUIs

The immediate-mode concept is a fairly recent concept popularised by Casey Muratori, who demonstrates the differences between immediate-mode and retained mode user interfaces.

For more information about these differences, you can take a look at the following articles:

 * [Casey's video explaining the IMGUI process](https://mollyrocket.com/861)
 * [MSDN article explaining the difference between Immediate-Mode and Retained-Mode GUI](https://msdn.microsoft.com/en-us/library/windows/desktop/ff684178(v=vs.85).aspx)

package imguifl;

import openfl.text.TextFormat;
import openfl.Assets;

class Fonts
{
    
    @:isVar public static var fonts(get, null):Map<String, TextFormat>;
    private static function get_fonts()
    {
        if (fonts == null)
            fonts = new Map<String, TextFormat>();
        
        return fonts;
    }
    
    public static function init()
    {
        fonts.set("cinzel_regular", new TextFormat(Assets.getFont("fonts/Cinzel-Regular.ttf").fontName, 12));
        fonts.set("cinzel_bold", new TextFormat(Assets.getFont("fonts/Cinzel-Bold.ttf").fontName, 12));
        fonts.set("cinzel_black", new TextFormat(Assets.getFont("fonts/Cinzel-Black.ttf").fontName, 12));
        fonts.set("comfortaa_regular", new TextFormat(Assets.getFont("fonts/Comfortaa-Regular.ttf").fontName, 12));
        fonts.set("comfortaa_bold", new TextFormat(Assets.getFont("fonts/Comfortaa-Bold.ttf").fontName, 12));
        fonts.set("comfortaa_light", new TextFormat(Assets.getFont("fonts/Comfortaa-Light.ttf").fontName, 12));
        fonts.set("crimsontext_roman", new TextFormat(Assets.getFont("fonts/CrimsonText-Roman.ttf").fontName, 12));
        fonts.set("crimsontext_bold", new TextFormat(Assets.getFont("fonts/CrimsonText-Bold.ttf").fontName, 12));
        fonts.set("crimsontext_bolditalic", new TextFormat(Assets.getFont("fonts/CrimsonText-BoldItalic.ttf").fontName, 12));
        fonts.set("crimsontext_semibold", new TextFormat(Assets.getFont("fonts/CrimsonText-Semibold.ttf").fontName, 12));
        fonts.set("crimsontext_semibolditalic", new TextFormat(Assets.getFont("fonts/CrimsonText-SemiboldItalic.ttf").fontName, 12));
        fonts.set("crimsontext_italic", new TextFormat(Assets.getFont("fonts/CrimsonText-Italic.ttf").fontName, 12));
    }
    
}
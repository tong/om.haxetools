package haxe;

using StringTools;

/*
typedef HaxeParam = {
    var type : HaxeParamType;
    @:optional var value : String;
}
*/

// TODO See: https://github.com/snowkit/atom-haxe/blob/eea049938cfcb70727b779bf36f4b2265c644591/lib/utils/hxml.js

class Hxml {

    /*
    public var params : Array<HaxeParam>;
    //public var defines : Array<String>;
    //public var metas : Array<HaxeParam>;

    public function new( ?params : Array<HaxeParam>, ?defines : Array<String> ) {
        this.params = (params == null) ? [] : params;
        //this.defines = (defines == null) ? [] : defines;
    }
    */

    /*
    public function toString( lineBreaks = false ) : String {
        var buf = new StringBuf();
        for( param in params ) {
            buf.add( param.type );
            if( param.value != null ) {
                buf.add( ' ' );
                buf.add( param.value );
            }
            if( lineBreaks ) buf.add( '\n' );
        }
        return buf.toString();
    }
    */

    /**
    */
    public static function parseTokens( str : String ) : Array<String> {
        var parts = new Array<String>();
        var expr = ~/ +/g;
        for( line in str.split( '\n' ) ) {
            line = line.trim();
            if( line.length == 0 )
                continue;
            var commentIndex = line.indexOf( '#' );
            if( commentIndex != -1 ) line = line.substring( 0, commentIndex-1 );
            if( line.length == 0 )
                continue;
            parts = parts.concat( expr.split( line ) );
        }
        return parts;
    }

    /**
        Parses groups of actual calls to the haxe compiler when using --each --next.
    */
    /*
    public static inline function parseCalls( str : String ) : Array<Array<String>> {

        var tokens = parseTokens( str );
        var eachIndex = tokens.indexOf( '--each' );

        if( eachIndex == -1 )
            return [tokens];

        var eachArgs = tokens.slice( 0, eachIndex );
        var remainArgs = tokens.slice( eachIndex+1 );
        var calls = new Array<Array<String>>();
        var currentCall : Array<String> = null;
        for( arg in remainArgs ) {
            if( arg == '--next' ) {
                currentCall = [];
                calls.push( currentCall );
            } else {
                currentCall.push( arg );
            }
        }
        for( call in calls ) {
            for( arg in eachArgs )
                call.push( arg );
        }
        return calls;
    }
    */

}
//Created by yangxiaowei at 2018/06/07
class LLog {
    static bool _debug = true;
 
    static void setDebug(bool debug) {
        LLog._debug = debug;
    }

    static bool get debug => _debug;

    static void d(String tag, String message) {

        if (_debug) {
            _print('D', tag, message);
            
        }
    }

    static void i(String tag, String message) {

        if (_debug) {
            _print('I', tag, message);
        }
    }

    static void w(String tag, String message) {

        if (_debug) {
            _print('W', tag, message);
        }
    }

    static void e(String tag, String message) {

        if (_debug) {
            _print('E', tag, message);
        }
    }

    static void _print(String prefix, String tag, String message) {
        print('$prefix/$tag: $message');
    }
}
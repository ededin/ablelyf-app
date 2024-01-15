//package com.tuc.ablelyf
//
//import io.flutter.Log
//import io.flutter.plugin.common.EventChannel
//import org.json.JSONObject
//
//class LandmarkStream(mainActivity: MainActivity) {
//
//    private  var mainActivity:MainActivity = mainActivity;
//
//  private var events: EventChannel.EventSink? = null;
//
//    fun onListen(args: Any?, events: EventChannel.EventSink){
//
//       this.events=events;
//
//
////        send(JSONObject("""{ "data":"Test" }"""))
//
//        Log.d("landmarkerListenerListen", args.toString())
//
//    }
//
//   public fun send(data:Any?){
//        Log.d("Send Landmark data",data.toString())
//       mainActivity.runOnUiThread {
//           events?.success(data.toString())
//
//       }
//   }
//
//
//    fun onCancel(args: Any?){
//
//        events=null;
//
//        Log.d("landmarkerListenerCancel", args.toString())
//
//    }
//}
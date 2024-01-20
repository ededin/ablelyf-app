package com.tuc.ablelyf


import androidx.camera.core.ImageProxy
import com.google.mediapipe.tasks.components.containers.NormalizedLandmark
import io.flutter.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel
import org.json.JSONObject
import java.nio.Buffer
import java.nio.ByteBuffer

class MainActivity: FlutterActivity(),FaceLandmarkerHelper.LandmarkerListener {

    var landmarkerListener:String = "LandmarkListener";
    private val CHANNEL = "facelandmark"

    val landmarkStream = LandmarkStream(this)

    var faceLandmarkerHelper:FaceLandmarkerHelper? = null;



    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)


        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call, result ->
            when (call.method) {
                "start" -> {

                    faceLandmarkerHelper = FaceLandmarkerHelper(context = applicationContext, faceLandmarkerHelperListener = this,);

                    //faceLandmarkerHelper.setupFaceLandmarker()

//                    call.argument<ByteArray>("bytes")?.let { Log.d("Params - ", it.size.toString()) }

//                    faceLandmarkerHelper.detectLiveStream(,isFrontCamera = true)


                    result.success("Success")
                }
                "data" -> {
                    //faceLandmarkerHelper.setupFaceLandmarker()

                    val bytes:ArrayList<ByteArray> =  call.argument<ArrayList<ByteArray>>("bytes")!!;
                    val height:Int =  call.argument<Int>("height")!!;
                    val width:Int =  call.argument<Int>("width")!!;
                    val rotation:Float =  call.argument<Float>("rotation")!!;

//                    val buffer = ByteBuffer.wrap(bytes)

//                    buffer.rewind()

                    faceLandmarkerHelper?.detectLiveStream(planes=bytes, height = height, width =width , rotationDegrees = rotation, isFrontCamera = true)


                    result.success("Test---------")
                }

                "stop" -> {
                    //  faceLandmarkerHelper.clearFaceLandmarker()

//                    call.arguments

//                    faceLandmarkerHelper.detectLiveStream(,isFrontCamera = true)
                }

                else -> {
                    result.notImplemented()
                }
            }
        }

        EventChannel(flutterEngine.dartExecutor.binaryMessenger,landmarkerListener).setStreamHandler(
            object : EventChannel.StreamHandler {
                override fun onListen(args: Any?, events: EventChannel.EventSink) {
                    Log.d(landmarkerListener, "Adding listener")

                    landmarkStream.onListen(args,events);

                }

                override fun onCancel(args: Any?) {
                    Log.d(landmarkerListener, "Cancelling listener")
                    landmarkStream.onCancel(args);

                }
            }
        )
    }

    override fun onError(error: String, errorCode: Int) {
        Log.d("Error", "$error ==== $errorCode")

    }

    override fun onResults(resultBundle: FaceLandmarkerHelper.ResultBundle) {
        Log.d("Result",resultBundle.result.faceLandmarks().get(0).size.toString())

        val landmark = resultBundle.result.faceLandmarks()[0];

        val  left = landmark[463] //left
        val  top = landmark[442] //top
        val  right = landmark[263] //right
        val  bottom = landmark[253] //bottom
        val  eye = landmark[473] //center


        val sublist = landmark.map { a-> """ {"x":${a.x()},"y":${a.y()}} """ }

        val focuswidth = right.x()-left.x()
        val focusheight = bottom.y()-top.y()


        val actualleft = NormalizedLandmark.create((left.x()+(focuswidth*0.5)).toFloat(),left.y(),0f)
        val actualtop = NormalizedLandmark.create(top.x(),(top.y()+(focusheight*0.4)).toFloat(),0f)
        val actualbottom = NormalizedLandmark.create(bottom.x(),(bottom.y()-(focusheight*0.3)).toFloat(),0f)
        val actualright = NormalizedLandmark.create((right.x()-(focuswidth*0.35)).toFloat(),right.y(),0f)

        val list =  listOf(actualleft,actualtop,actualbottom,eye,actualright);
//                val list =  listOf(left,right,bottom,eye,top);

        val actualfocuswidth = actualright.x()-actualleft.x()
        val actualfocusheight = actualbottom.y()-actualtop.y()



//                val leftPercentage = (eye.x() - left.x())/focuswidth
//                val topPercentage = (eye.y() - top.y())/focusheight



        val actualleftPercentage = (eye.x() - actualleft.x())/actualfocuswidth
        val actualtopPercentage = (eye.y() - actualtop.y())/actualfocusheight

        val leftBrowTop = landmark[145]
        val leftBrowBottom = landmark[159]

        val diff =leftBrowTop.y()-leftBrowBottom.y()

        Log.d("leftBrow",diff.toString())

        var click = false;

        if(diff<0.004){
            click = true;
        }

        Log.d("leftBrow",click.toString())


        val data:JSONObject = JSONObject( """
            {"eye": { "x" : ${eye.x()},"y" : ${eye.y()} },
            "left": { "x" : ${actualleft.x()},"y" : ${actualleft.y()} },
            "right": { "x" : ${actualright.x()},"y" : ${actualright.y()} },
            "top": { "x" : ${actualtop.x()},"y" : ${actualtop.y()} },
            "bottom": { "x" : ${actualbottom.x()},"y" : ${actualbottom.y()} },
            "width": ${actualfocuswidth},
            "height": ${actualfocusheight},
            "leftPercentage":${actualleftPercentage},
            "topPercentage":${actualtopPercentage},
            "click":${click}
            }""".trimIndent())

//        Log.d("Result", detections.toString())
        landmarkStream.send(data)

//        landmarkStream.send(detections.map { it.detections().map { a -> JSONObject( """ { "box" : { "top" : ${ a.boundingBox().top } , "bottom" : ${ a.boundingBox().bottom } , "left" : ${ a.boundingBox().left } , "right" : ${ a.boundingBox().right }   }, "category" :"${ a.categories()[0].categoryName() }", "score" : ${a.categories()[0].score()} } } """) } })

    }
}


// scene 3

#include "settings.inc"
#include "colors.inc"

//---------------------------------------------------------------

#include "space_wallpaper.inc" // background

camera {
    perspective
    location <0,0,-30>
    look_at <0,0,1>
    right x*(image_width/image_height)
}

light_source {
    <5,2,2>
    color rgb <1,1,1>
    parallel
    point_at <0,0,1>
}

#declare Arm_Seg_Red = cylinder {
    <0, 0, 0>, <0, 6, 0>, 1*0.5
    pigment { color Red }
}

#declare Arm_Seg_Green = cylinder {
    <0, 0, 0>, <0, 4, 0>, 0.8*0.5
    pigment { color Green}
}

#declare Arm_Seg_Blue = cylinder {
    <0, 0, 0>, <0, 2, 0>, 0.6*0.5
    pigment { color Blue}
}

union {
    object { Arm_Seg_Red }
    union {
        object { Arm_Seg_Green }
        union {
            object { Arm_Seg_Blue }
            rotate z*1440*clock
            translate <0,4,0>
        }
        rotate z*720*clock
        translate <0,6,0>
    }
    rotate z*360*clock
}

/*
// arm
object {
    Arm_Seg_1
    union {
        Arm_Seg_2
        object {
            Arm_Seg_3
        }
    }
    translate <0,0,4
}
*/

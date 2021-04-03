objs = selection as array


/* Notes 
 - This is incredibly jank and probably has tons of bugs
 - Gist of this is that it mirrors the animation, then calculates the difference between each frame and applies that to the original pose. 
 - Results tend to be slighty off so you may have to tweak varous values in the script to get exactly what you want
	- masterRotOffsetFix and master PosOffsetFix adjust the intial position slightly
	- zeroReferenceFrame uses a custom tpose matrix i setup for the DS1 skeleton. if you turn this off you may get better or worse results
	- the way it determines whether a bone is right or left hand is with the first 2 characters of the name "L_" and "R_" and also a few other speical cases

/* Settings */
animStart = 0
animEnd = 46
animSpacingOffset = 5
zeroReferenceFrame = true

/* Default pose data */
defaultPose = #(
	(quat -0.707107 0 0 0.707107),
	(quat 1.50079e-007 0.707106 -1.50079e-007 0.707108),
	(quat 0 -0.707106 0 0.707108),
	(quat -0.707107 0.707107 2.57448e-007 0),
	(quat 0.00996692 -9.56439e-007 0.99995 -2.91621e-007),
	(quat 1.61407e-007 0.0947547 -7.75229e-007 0.995501),
	(quat 0 -0.084656 -7.06843e-007 0.99641),
	(quat -5.05773e-007 -0.707229 5.05752e-007 0.706985),
	(quat 1.69572e-007 0.0947547 -6.89446e-007 0.995501),
	(quat -0.235174 0.681729 -0.646934 -0.247821),
	(quat 0.00996692 -9.55568e-007 0.99995 -2.04203e-007),
	(quat 1.61406e-007 0.0947559 -7.75228e-007 0.995501),
	(quat 0 -0.084658 -8.03869e-007 0.99641),
	(quat -5.9007e-007 -0.706985 5.90041e-007 0.707229),
	(quat 1.69571e-007 0.0947559 -6.89446e-007 0.995501),
	(quat 0.247822 -0.646936 0.681727 0.235173),
	(quat 0.0241804 -0.811457 -0.0120902 0.583786),
	(quat 0.703667 -0.691576 0.095701 0.131972),
	(quat 0 0 4.76837e-007 1),
	(quat -0.000190026 -0.000349985 0.477158 0.878817),
	(quat 0.707106 0.707107 -5.39466e-005 -5.40535e-005),
	(quat 0.707106 0.707107 -5.39466e-005 -5.40535e-005),
	(quat 0.707107 -0.707106 0.000334255 0.000334531),
	(quat -0.000397956 -0.011526 6.25574e-006 0.999933),
	(quat -1.86208e-007 0.0567382 1.41301e-006 0.998389),
	(quat -0.696053 0.0169264 -0.0314347 0.717102),
	(quat -0.635842 0.0303594 -0.326109 0.698882),
	(quat 2.32129e-007 -0.013148 4.73661e-007 0.999914),
	(quat 2.38418e-007 -1.02818e-006 4.76837e-007 1),
	(quat 0.000398159 -1.37624e-006 2.37871e-007 1),
	(quat 2.38418e-007 -1.37539e-006 2.38418e-007 1),
	(quat 2.38418e-007 -1.37539e-006 2.38418e-007 1),
	(quat 0.000398159 -1.37624e-006 2.37871e-007 1),
	(quat 2.38418e-007 -1.37539e-006 2.38418e-007 1),
	(quat 2.38418e-007 -1.37539e-006 2.38418e-007 1),
	(quat -8.23711e-007 -0.130527 0 0.991445),
	(quat 1 -2.38418e-007 -1.37615e-006 -1.94707e-007),
	(quat -1.5687e-007 0.0567382 1.41468e-006 0.998389),
	(quat 0 0.0115261 1.19184e-006 0.999934),
	(quat -0.0980369 -0.0114709 -0.0011197 0.995116),
	(quat 0.707106 0.707107 0 -9.62281e-007),
	(quat 0 0 4.76837e-007 1),
	(quat 0 9.53674e-007 4.76837e-007 1),
	(quat 0.707106 0.707107 0 0),
	(quat 0.0003979 -0.0115261 -5.06328e-006 0.999933),
	(quat 0 0.0567382 0 0.998389),
	(quat 0.741585 -0.00863595 -0.0297074 0.670145),
	(quat 0.635842 0.0303598 0.326109 0.698882),
	(quat 0 -0.0131477 2.38398e-007 0.999914),
	(quat 0 -7.00354e-007 2.38419e-007 1),
	(quat -0.000398019 -2.08711e-007 -2.38336e-007 1),
	(quat 0 -2.27214e-007 -1.49012e-007 1),
	(quat 0 -2.27214e-007 -2.38419e-007 1),
	(quat -0.00039802 -2.16162e-007 -2.38333e-007 1),
	(quat 0 -2.27214e-007 -1.49012e-007 1),
	(quat 0 -2.27214e-007 -1.49012e-007 1),
	(quat 0 -0.130526 0 0.991445),
	(quat 0 -2.16067e-007 -2.38419e-007 1),
	(quat 0 0.0567382 0 0.998389),
	(quat 0.0115249 0 0.999934 1.94694e-007),
	(quat 0.098037 -0.011471 0.00112097 0.995116),
	(quat 0.707106 0.707107 0 -9.62281e-007)
)

(
sliderTime = 0
	
local animLength = animEnd - animStart
local srcStart = animStart
local srcEnd = animEnd
local resStart = animEnd + animSpacingOffset
local resEnd = animEnd + animLength + animSpacingOffset
local mirStart = resEnd + animSpacingOffset
local mirEnd = resEnd + animLength + animSpacingOffset

if zeroReferenceFrame then (
print("Zeroing reference frame...")
with animate on (
	local i = 0
	for obj in objs do (
		at time (srcStart) obj.rotation.controller.value = defaultPose[i+1]
		i += 1
	)
)
)
	
print("Copying keyframes...")
with animate on (
for t=0 to animLength do (	
	for obj in objs do (
		at time (t+srcStart) obj.transform = copy (at time (t+srcStart) obj.transform)
		at time (t+resStart) obj.transform = copy (at time (srcStart) obj.transform)
		at time (t+mirStart) obj.transform = copy (at time (t+srcStart) obj.transform)
	)
)
)

print("Mirroring animation...")
for obj in objs do (
	obj.setBoneEnable false 0
)

with animate on (
	for t=mirStart to mirEnd do (
		for obj in objs do (
			/* Right <-> Left */
			local ss = substring obj.name 1 2
			if ss == "R_" or ss == "RU" or ss == "RC" then (
				local na = substring obj.name 3 -1
				if ss == "R_" then na = "L_" + na
				if ss == "RU" then na = "LU" + na
				if ss == "RC" then na = "LC" + na
				local lobj = execute ("$'" + na + "'")
				
				local ltransform = copy (at time t lobj.transform)
				local rtransform = copy (at time t obj.transform)
				
				local rChildTransforms = #()
				local lChildTransforms = #()
				for i=1 to obj.children.count do (
					rChildTransforms[i] = copy (at time t obj.children[i].transform)
					lChildTransforms[i] = copy (at time t lobj.children[i].transform)
				)
				
				at time t lobj.transform = rtransform
				at time t obj.transform = ltransform
					
				for i=1 to obj.children.count do (
					at time t obj.children[i].transform = rChildTransforms[i]
					at time t lobj.children[i].transform = lChildTransforms[i]
				)
			)
		)
		
		for obj in objs do (
			local childTransforms = #()
			for i=1 to obj.children.count do (
				childTransforms[i] = copy (at time t obj.children[i].transform)
			)
			
			at time(t) obj.position.x *= -1
			
			local localTransform = at time(t) obj.transform
			local posTransform = transMatrix localTransform.translationPart
			localTransform *= inverse posTransform
			local localRot = (at time(t) obj.transform.rotationPart) as eulerAngles
			localRot.y *= 1
			localRot.z *= -1
			localRot.x *= -1
			at time(t) obj.transform = ((localRot as Matrix3) *  ((eulerAngles 0 0 -180) as Matrix3)) * posTransform
			
			for i=1 to obj.children.count do (
				at time t obj.children[i].transform = childTransforms[i]
			)
		)
	)
)

print("Extracting motion...")
with animate on (
	local masterRotOffsetFix = 0
	local masterPosOffsetFix = 10
	for t=0 to animLength do (
		for obj in objs do (
			if obj.name == "Master"  then (
				local mirBaseTransform = copy (at time (mirStart) obj.transform)
				local resBaseTransform = copy (at time (t + resStart) obj.transform)
				local mirFrameTransform = (at time (t + mirStart) obj.transform)
				
				local mirMotionDiff = mirFrameTransform * (inverse mirBaseTransform)
				local translationDiff = mirMotionDiff.translationPart
				local rotationDiff = mirMotionDiff.rotationPart
				rotationDiff = (quat rotationDiff.z -rotationDiff.x -rotationDiff.y rotationDiff.w)

				local scaleDiff = (Point3 1 1 1)
				mirMotionDiff = (scaleMatrix scaleDiff) * (rotationDiff as Matrix3) * (transMatrix (Point3 0 0 0))
									
				at time (t + resStart) obj.transform = resBaseTransform * mirMotionDiff
					
				at time (t + resStart) obj.position.controller.value =  (at time (t +mirStart) obj.position.controller.value)
				at time (t + resStart) obj.position.controller.value.y *= -1
				at time (t + resStart) obj.position.controller.value.x *= -1
					
				if t == 1 then (
					masterRotOffsetFix = (rotationDiff as eulerAngles).x
				)
				
				local root = execute("$'DummyRoot'")
				at time (t + resStart) root.position.controller.value.y += masterPosOffsetFix
			)
			else (
				local mirBaseTransform = copy (at time (mirStart) obj.transform)
				local resBaseTransform = copy (at time (t + resStart) obj.transform)
				local mirBaseLocalTransform = mirBaseTransform
				local resBaseLocalTransform = resBaseTransform
				if obj.parent != undefined then (
					mirBaseLocalTransform = mirBaseLocalTransform * (inverse (at time (mirStart) obj.parent.transform))
					resBaseLocalTransform = resBaseLocalTransform * (inverse (at time (t + resStart) obj.parent.transform))
				)

				local mirFrameLocalTransform = (at time (t + mirStart) obj.transform)
				if obj.parent != undefined then (
					mirFrameLocalTransform = mirFrameLocalTransform * (inverse (at time (t + mirStart) obj.parent.transform))
				)
				local translationDiff = transMatrix ((inverse mirBaseLocalTransform) * mirFrameLocalTransform).translationPart
				local rotationDiff = ((inverse mirBaseLocalTransform).rotationPart * mirFrameLocalTransform.rotationPart) as Matrix3
				local scaleDiff = scaleMatrix (Point3 1 1 1)
				
				if obj.name == "Upper_Root" then rotationDiff *= (eulerAngles 0 0 (masterRotOffsetFix * -3.5)) as Matrix3
				
				local mirLocalMotionDiff = scaleDiff * rotationDiff * translationDiff
				
				local resTransform = resBaseLocalTransform * mirLocalMotionDiff
				if obj.parent != undefined then (
					resTransform = resTransform * (at time (t + resStart) obj.parent.transform)
				)
				at time (t + resStart) obj.transform = resTransform
			)
		)
	)
)

for obj in objs do (
	obj.setBoneEnable true 0
)

)
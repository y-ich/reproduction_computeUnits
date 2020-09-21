# Reproduction code of output difference among computeUnits on iOS 14/iPadOS 14

The MLModel ./MLModels/ModelUnderTest.mlmodel works fine on iOS 13/iPadOS 13 by all MLComputeUnits, but does not work on iOS 14/iPadOS 14 by MLComputeUnitsCPUAndGPU.

When you run the project for the first time, for example, on A12Z, Xcode debugger outputs

    2020-09-21 17:04:51.716757+0900 reproduction_computeUnits[4145:836414] MLComputeUnitsCPUOnly
    2020-09-21 17:04:51.795338+0900 reproduction_computeUnits[4145:836414] output: 2.465117 2.639317 -5.235253
    2020-09-21 17:04:51.795927+0900 reproduction_computeUnits[4145:836414] MLComputeUnitsCPUAndGPU
    2020-09-21 17:04:51.797703+0900 reproduction_computeUnits[4145:836414] Metal API Validation Enabled
    2020-09-21 17:04:51.901437+0900 reproduction_computeUnits[4145:836414] fopen failed for data file: errno = 2 (No such file or directory)
    2020-09-21 17:04:51.901517+0900 reproduction_computeUnits[4145:836414] Errors found! Invalidating cache...
    2020-09-21 17:04:52.107190+0900 reproduction_computeUnits[4145:836414] fopen failed for data file: errno = 2 (No such file or directory)
    2020-09-21 17:04:52.107239+0900 reproduction_computeUnits[4145:836414] Errors found! Invalidating cache...
    2020-09-21 17:04:52.846012+0900 reproduction_computeUnits[4145:836414] output: 1.697216 1.941883 -3.821616
    2020-09-21 17:04:52.848469+0900 reproduction_computeUnits[4145:836414] MLComputeUnitsAll
    2020-09-21 17:04:53.152296+0900 reproduction_computeUnits[4145:836414] output: 2.464226 2.640257 -5.235566

MLComputeUnitsCPUAndGPU's outputs are very different from others, which are correct.
This is the issue.
I have no idea whether the error messages for MLComputeUnitsCPUAndGPU are related with this issue.
The error message will disappear when running next time.

This mlmodel is been used on my commercial app.
Please fix it soon or Please let me know any workarounds to avoid this error on app side.

Thank you for your efforts!
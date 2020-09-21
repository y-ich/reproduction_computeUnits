# Reproduction code of output difference among computeUnits on iOS 14/iPadOS 14

The MLModel ./MLModels/ModelUnderTest.mlmodel works fine on iOS 13/iPadOS 13 by all MLComputeUnits, but does not work on iOS 14/iPadOS 14 by MLComputeUnitsCPUAndGPU.

When you run the project for the first time, for example, on A12Z, Xcode debugger outputs

    2020-09-21 17:24:16.377074+0900 reproduction_computeUnits[4168:842022] MLComputeUnitsCPUOnly
    2020-09-21 17:24:16.377128+0900 reproduction_computeUnits[4168:842022] model
    2020-09-21 17:24:16.416931+0900 reproduction_computeUnits[4168:842022] predict
    2020-09-21 17:24:16.449914+0900 reproduction_computeUnits[4168:842022] output: 2.465117 2.639317 -5.235253
    2020-09-21 17:24:16.450633+0900 reproduction_computeUnits[4168:842022] MLComputeUnitsCPUAndGPU
    2020-09-21 17:24:16.450666+0900 reproduction_computeUnits[4168:842022] model
    2020-09-21 17:24:16.451940+0900 reproduction_computeUnits[4168:842022] Metal API Validation Enabled
    2020-09-21 17:24:16.590315+0900 reproduction_computeUnits[4168:842022] fopen failed for data file: errno = 2 (No such file or directory)
    2020-09-21 17:24:16.590379+0900 reproduction_computeUnits[4168:842022] Errors found! Invalidating cache...
    2020-09-21 17:24:16.674689+0900 reproduction_computeUnits[4168:842022] predict
    2020-09-21 17:24:16.687835+0900 reproduction_computeUnits[4168:842022] fopen failed for data file: errno = 2 (No such file or directory)
    2020-09-21 17:24:16.687891+0900 reproduction_computeUnits[4168:842022] Errors found! Invalidating cache...
    2020-09-21 17:24:17.421485+0900 reproduction_computeUnits[4168:842022] output: 1.697216 1.941883 -3.821616
    2020-09-21 17:24:17.423897+0900 reproduction_computeUnits[4168:842022] MLComputeUnitsAll
    2020-09-21 17:24:17.423926+0900 reproduction_computeUnits[4168:842022] model
    2020-09-21 17:24:17.711605+0900 reproduction_computeUnits[4168:842022] predict
    2020-09-21 17:24:17.718201+0900 reproduction_computeUnits[4168:842022] output: 2.464226 2.640257 -5.235566

MLComputeUnitsCPUAndGPU's outputs are very different from others, which are correct.
This is the issue.
I have no idea whether the error messages for MLComputeUnitsCPUAndGPU are related with this issue.
The error message will disappear when running next time.

This mlmodel is been used on my commercial app.
Please fix it soon or Please let me know any workarounds to avoid this error on app side.

Thank you for your efforts!